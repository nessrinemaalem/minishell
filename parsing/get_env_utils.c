/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_env_utils.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: imaalem <imaalem@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/21 17:10:59 by armendes          #+#    #+#             */
/*   Updated: 2022/04/21 17:44:21 by imaalem          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

int	keep_going_till_dollar(char *str)
{
	int	i;

	i = 0;
	while (str[i] && str[i] != '$')
	{
		i++;
	}
	i++;
	return (i);
}

int	keep_going_till_end_of_var(char *str)
{
	int	i;

	i = 0;
	while (str[i] && str[i] != '$' && str[i] != ' '
		&& (ft_isalnum(str[i]) || str[i] == '_'))
		i++;
	return (i);
}

int	search_error_var_env(char *str)
{
	t_quote	quote;
	int		i;

	quote = NOTHING;
	i = 0;
	while (str[i])
	{
		quote = update_quote_status(str[i], quote);
		if (quote == NOTHING || quote == DOUBLE)
		{
			if (str[i] == '$' && str[i + 1] == '{')
			{
				if (str[i + 2] == '}')
					return (-1);
				i += 2;
				while (str[i] && (ft_isalnum(str[i]) || str[i] == '_'))
					i++;
				if (str[i] != '}')
					return (-2);
			}
		}
		i++;
	}
	return (0);
}

// char	**update_shlvl(char **env, int len)
// {
// 	char	**new_env;
// 	char	**args;
// 	char	*tmp;
// 	int		shlvl;

// 	new_env = malloc(sizeof(char *) * len);
// 	if (!new_env)
// 		error_and_exit(get_info(), 1);
// 	args = malloc(sizeof(char *) * 3);
// 	if (!args)
// 		error_and_exit(get_info(), 1);
// 	tmp = ft_getenv("SHLVL", env);
// 	shlvl = ft_atoi(tmp);
// 	free(tmp);
// 	shlvl++;
// 	args[0] = "";
// 	tmp = ft_itoa(shlvl);
// 	args[1] = ft_strjoin("SHLVL=", tmp);
// 	free(tmp);
// 	args[2] = NULL;
// 	new_env = update_env_export(env, args, 0);
// 	free(args[1]);
// 	free(args);
// 	return (new_env);
// }
