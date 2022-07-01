/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ted-dafi <ted-dafi@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/06/28 17:05:39 by ted-dafi          #+#    #+#             */
/*   Updated: 2022/07/01 03:15:04 by ted-dafi         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "global_utils.h"
#include <stdio.h>

int	ft_atoi(char *str, int *flag)
{
	int				i;
	int				sign;
	unsigned long	num;

	i = 0;
	sign = 1;
	num = 0;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == 32)
		i++;
	if (str[i] == '+' || str[i] == '-')
		if (str[i++] == '-')
			sign *= -1;
	if (!(str[i] >= '0' && str[i] <= '9') && flag)
		*flag = -1;
	while (str[i] >= '0' && str[i] <= '9')
	{
		num *= 10;
		num += str[i] - '0';
		if ((num > 9223372036854775807 && sign == 1)
			|| (num > 9223372036854775808UL && sign == -1))
			*flag = -1;
		i++;
	}
	if (str[i] && flag)
		*flag = -1;
	return (num * sign);
}
