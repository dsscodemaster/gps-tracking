/* ************************************************************************** */
/*  Company:                                                                  */
/*    Microchip Technology Inc.                                               */
/*                                                                            */
/*  File Name:                                                                */
/*    main.c                                                                  */
/*                                                                            */
/*  Summary:                                                                  */
/*    This file contains the "main" function for an MPLAB Harmony project.    */
/*                                                                            */
/*  Description:                                                              */
/*    This file contains the "main" function for an MPLAB Harmony project.The */
/*    "main" function calls the "SYS_Initialize" function to initialize the   */
/*    state machines of all MPLAB Harmony modules in the system and it calls  */
/*    the "SYS_Tasks" function from within a system-wide "super" loop to      */
/*    maintain their correct operation. These two functions are implemented   */
/*    in configuration-specific files (usually "system_init.c" and            */
/*    "system_tasks.c") in a configuration-specific folder under the "src/    */
/*    system_config" folder within this project's top-level folder. An MPLAB  */
/*    Harmony project may have more than one configuration, each contained    */
/*    within it's own folder under the "system_config" folder.                */
/* ************************************************************************** */

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <stdarg.h>
#include <limits.h>
#include "tick.h"
#include "utility.h"

/* ************************************************************************** */
/* Section: Global Data Definitions                                           */
/* ************************************************************************** */
static char byteMap[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
static int byteMapLen = sizeof(byteMap);

/* ************************************************************************** */
/* Section: User Functions                                                    */
/* ************************************************************************** */
/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
double utility_MovingAvgFiltering( uint16_t currVal,int16_t prevVal,uint16_t *sampleIndex,uint16_t sampleCount )
{
   int16_t temp;
   double d = prevVal;
    
   if(*sampleIndex < sampleCount)
        (*sampleIndex)++;
    else
        *sampleIndex = sampleCount;

    temp = currVal - prevVal;
    d += (double)temp/(*sampleIndex);
    return d;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
int16_t utility_ConvertAsciitextStreamToTextStream(char *out, uint8_t *in, uint16_t len)
{
    uint16_t i,ascii_val,n=0;
    uint8_t n1,n2;
    
    for( i=0;i<len;i+=2 )
    {
        n1 = utility_nibbleFromChar(in[i]);
        n2 = utility_nibbleFromChar(in[i+1]);
        ascii_val = 16*n1 + n2;
        sprintf(&out[n++],"%c",ascii_val);
    }
    out[n] = '\0';
    return strlen(out);
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
int16_t utility_ConvertHexStreamToAsciiStream(char *out, uint8_t *in,uint16_t len)
{
    char lbuf[2*len+4];
    uint16_t i,n=0;
 
    for( i=0; i<len; i++ )
    {
        sprintf(&lbuf[2*i],"%02x",in[i]);
		n += 2;
    }
    strcpy(out,lbuf);
    return n;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
int16_t utility_ConvertAsciiStreamToHexStream(uint8_t *out, char *in,uint16_t len)
{
    uint16_t i,n=0;
    uint8_t n1,n2,hex;
    
    for( i=0; i<len; i+=2 )
    {
        n1 = utility_nibbleFromChar(in[i]);
        n2 = utility_nibbleFromChar(in[i+1]);
        hex = 16*n1 + n2;
        out[n++]= hex;
    }
    
    return n;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
uint16_t utility_GetIndexOfMaxValInt(int16_t *arr,int16_t size)
{
    int16_t maxValIndex = 0,maxVal;
    int16_t index;
    
    maxVal = 0;
    for(index = 0;index < size;index++)
    {
        if(arr[index] > maxVal)
        {
            maxVal = arr[index];
            maxValIndex = index;
        }
    }
    return maxValIndex;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
uint16_t utility_GetIndexOfMaxval(double *data, uint16_t count) 
{
 	double d = 0;
	int i,maxIndex = 0;
	
	for( i=0; i<count; i++ )
	{
		if( d < data[i] )
		{
			d = data[i];
			maxIndex = i;
		}
	}
	return maxIndex;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
uint16_t utility_GetIndexOfMinval(double *data, uint16_t count) 
{
 	double d = 0;
	int i,minIndex = 0;
	
	for( i=0; i<count; i++ )
	{
		if( d > data[i] )
		{
			d = data[i];
			minIndex = i;
		}
	}
	return minIndex;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
uint16_t utility_SortAccordingToIndex( double *data, uint16_t *idx, uint16_t count ) 
{
	uint16_t i,j,temp;
	
	for( i=0; i<count; i++ )
	{
		idx[i] = i;
	}
	
    for(i=0; i<count; i++)
    {
        for(j=i+1; j<count; j++)
        {
            if(data[idx[j]] < data[idx[i]])
            {
                temp = idx[i];
                idx[i] = idx[j];
                idx[j] = temp;
            }
        }
    }
    
    return 0;
}


 

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>

  <p><b>Remarks:</b></p>
*/
static void swap(double *xp,double *yp)
{
    double temp = *xp;
    *xp = *yp;
    *yp = temp;
}

static void selectionSort(double arr[], int n)
{
    int i, j, min_idx;
 
    // One by one move boundary of unsorted subarray
    for (i = 0; i < n-1; i++)
    {
        // Find the minimum element in unsorted array
        min_idx = i;
        for (j = i+1; j < n; j++)
          if (arr[j] < arr[min_idx])
            min_idx = j;
 
        // Swap the found minimum element with the first element
        swap(&arr[min_idx], &arr[i]);
    }
}

void utility_sort_ascending_order( double *data,double *out, uint16_t n ) 
{
	memcpy(out,data,n);
	selectionSort(out, n);
}

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
*/
char utility_nibbleToChar(uint8_t nibble)
{
	if(nibble < byteMapLen) return byteMap[nibble];
	return '*';
}

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
uint8_t utility_nibbleFromChar(char c)
{
	if(c >= '0' && c <= '9') return c - '0';
	if(c >= 'a' && c <= 'f') return c - 'a' + 10;
	if(c >= 'A' && c <= 'F') return c - 'A' + 10;
	return 255;
}

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
*/
char* utility_bytesToHexString(uint8_t *bytes, size_t buflen)
{
	char *retval;
	int i;
	
	retval = malloc(buflen*2 + 1);
	for(i=0; i<buflen; i++) {
		retval[i*2] = utility_nibbleToChar(bytes[i] >> 4);
		retval[i*2+1] = utility_nibbleToChar(bytes[i] & 0x0f);
	}
    retval[i] = '\0';
	return retval;
}

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
*/
uint8_t* utility_hexStringToBytes(char *inhex)
{
	uint8_t *retval;
	uint8_t *p;
	int len, i;
	
    len = strlen(inhex) / 2;
	retval = malloc(len+1);
	for(i=0, p = (uint8_t *) inhex; i<len; i++) {
		retval[i] = (utility_nibbleFromChar(*p) << 4) | utility_nibbleFromChar(*(p+1));
		p += 2;
	}
    retval[len] = 0;
    
	return retval;
}

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
*/
uint32_t utility_hexStringToDecimalValue(char *hexString,uint16_t len)
{
	uint32_t retval=0;
	uint16_t i = 0;
    uint8_t nibble = 0;
	
	for(i=0; i<len; i++) 
    {
        nibble = utility_nibbleFromChar(hexString[i]);
		retval |= ( nibble << 4*(len-i-1) );
	}
    return retval;
}

/**
  <p><b>Function:</b></p>

  <p><b>Summary:</b></p>

  <p><b>Description:</b></p>
  
  <p><b>@Params:</b></p>
	type -> 0 => LOWER_TO_UPPER
	type -> 1 => UPPER_TO_LOWER
  <p><b>Remarks:</b></p>
*/
char *utility_convert_string_case( int type, const char *in, char *out, uint16_t size ) 
{
	uint16_t i;
	
	for( i=0; i<size; i++ )
	{
		if(type == 0)
			out[i] = (char)toupper(in[i]);
		else
			out[i] = (char)tolower(in[i]);
	}
	
	out[i] = '\0';
	
	return out;
}

void *btd_malloc(size_t size)
{
	if (__builtin_expect(!!size, 1)) {
		void *ptr;

		ptr = malloc(size);
		if (ptr)
			return ptr;

		fprintf(stderr, "failed to allocate %u bytes\n", size);
		abort();
	}

	return NULL;
}

double utility_calculate_mean(double *x, uint16_t n)
{
	int i;
	double sum =0.0;
	double mean = 0.0;
	
	for(i=0; i<n; i++)
		sum += x[i];
	
	mean = sum/n;
	return mean;
}

double utility_calculate_max(double *x, uint16_t n)
{
	double max = 0.0;
	int i;
	
	for( i=0; i<n; i++ )
	{
		if( max < x[i] )
			max = x[i];
	}
	return max;
}

double utility_calculate_min(double *x, uint16_t n)
{
	double min = 0.0;
	int i;
	
	for( i=0; i<n; i++ )
	{
		if( min > x[i] )
			min = x[i];
	}
	return min;
}

double utility_calculate_variance(double *x, uint16_t n)
{
	int i;
	double sum = 0.0,var = 0.0;
	double mean = utility_calculate_mean(x,n);
	
	for(i=0; i<n; i++)
		sum  += (x[i]-mean);
	
	var = sum/n; 
	return var;	
}

double utility_calculate_sd(double *x, uint16_t n)
{
	double sd = 0.0;
	double var = utility_calculate_variance(x,n);
	
	sd = sqrt(var); 
	return sd;
}

double utility_calculate_median(double *x, uint16_t n)
{
    double temp = 0.00;
	double x1[n+1];
    int i, j;
    double med = 0.00;
	
	memcpy(x1,x,n*sizeof(double));
    for (i = 0; i < n - 1; i++) 
	{
        for (j = i + 1; j < n; j++) 
		{
            if (x1[j] < x1[i]) 
			{
                temp = x1[i];
                x1[i] = x1[j];
                x1[j] = temp;
            }
        }
    }
	
    if (n % 2 == 0) 
	{
        med = ((x1[n / 2] + x1[n / 2 - 1]) / 2.0);
    } 
	else 
	{
        med = x1[n / 2];
    }
	
	return med; 
}
double utility_calculate_rms( double *data, uint16_t n)
{
	int i;
	double s=0.0;
	
	for(i=0; i<n; i++)
		s += pow(data[i],2);
	
	return (sqrt(s)/n);
}

void utility_calculate_percentiles(double *percent,uint16_t n_out,double *data, uint16_t n)
{
	int i,index;
	double temp0;
	double *temp = (double *)malloc((n+1)*sizeof(double));
	
	utility_sort_ascending_order(data,temp,n);
	
	for(i=0; i<n_out; i++)
	{
		temp0 = percent[i]*n;
		if((temp0 -fabs(temp0)) != 0.0)
		{
			index = (int)fabs(temp0);
			percent[i] = temp[index];
		}
		else
		{
			index = (int)temp0;
			percent[i] = (temp[index]+temp[index+1])/2;
		}
	}
	free(temp);
}


void utility_convert_tick_to_time(uint64_t tick,uint16_t *days, uint16_t *hours, uint16_t *minutes)
{
    uint64_t l = tick;
    
     l /= TICK_MINUTE;
     *minutes = l%60;
     l /= 60;
     *days = l/24;
     *hours = l%24;
}

/* End of file */
