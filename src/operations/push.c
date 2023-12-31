/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpovill- <mpovill-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/19 12:11:32 by mpovill-          #+#    #+#             */
/*   Updated: 2023/12/19 12:20:50 by mpovill-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

/*
 *	Take the first element at the top of stk_origin 
 *	and put it at the top of stk_destination.
 *	Do nothing if stk_origin is empty.
 */
static void	push(t_stack *stk_org, t_stack *stk_dest)
{
	t_list	*top;

	if (stk_org->n_elem == 0)
		return ;
	top = pop_top(stk_org);
	push_top(stk_dest, top);
}

void	perform_push(t_stack *stk_org, t_stack *stk_dest)
{
	ft_printf(1, "p%c\n", stk_dest->name);
	push(stk_org, stk_dest);
}
