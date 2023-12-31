/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   stack_methods.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpovill- <mpovill-@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/09/14 12:11:32 by mpovill-          #+#    #+#             */
/*   Updated: 2023/09/14 12:20:50 by mpovill-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	put_elem_on_top(t_stack *stk, t_list *lst)
{
	if (find_shortest_path(lst))
		while (get_top_value(stk) != get_lower_value(lst))
			perform_reverse_rotate(stk);
	else
		while (get_top_value(stk) != get_lower_value(lst))
			perform_rotate(stk);
}

int	get_value_stk(t_list *stk_lst)
{
	int	number;

	number = ((t_node *)(stk_lst->content))->number;
	return (number);
}

int	get_bottom_value(t_stack *stk)
{
	return (get_value_stk(stk->bottom_node));
}

int	get_top_value(t_stack *stk)
{
	return (get_value_stk(stk->top_node));
}

t_stack	*create_stack(char name, char *err)
{
	t_stack	*stk;

	stk = malloc(sizeof(t_stack));
	if (!stk)
	{
		*err = 1;
		return (NULL);
	}
	stk->name = name;
	stk->top_node = NULL;
	stk->bottom_node = NULL;
	stk->n_elem = 0;
	return (stk);
}
