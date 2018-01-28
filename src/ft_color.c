/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_color.c				                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dbauduin <dbauduin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/10/12 17:57:50 by dbauduin          #+#    #+#             */
/*   Updated: 2017/10/22 22:30:03 by dbauduin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <printf.h>

int			ft_color(char *s, int i, int *c)
{
	if (!ft_strncmp(&s[i], "{red}", 5) && (i += 5))
		write(1, "\x1b[31m", 6);
	else if (!ft_strncmp(&s[i], "{green}", 7) && (i += 7))
		write(1, "\x1b[32m", 6);
	else if (!ft_strncmp(&s[i], "{yellow}", 8) && (i += 8))
		write(1, "\x1b[33m", 6);
	else if (!ft_strncmp(&s[i], "{blue}", 6) && (i += 6))
		write(1, "\x1b[34m", 6);
	else if (!ft_strncmp(&s[i], "{magenta}", 9) && (i += 9))
		write(1, "\x1b[35m", 6);
	else if (!ft_strncmp(&s[i], "{cyan}", 6) && (i += 6))
		write(1, "\x1b[36m", 6);
	else if (!ft_strncmp(&s[i], "{eoc}", 5) && (i += 5))
		write(1, "\x1b[0m", 5);
	else if ((i += 1) && ((*c) += 1))
		write(1, "{", 1);
	return (i);
}
