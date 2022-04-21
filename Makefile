# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: imaalem <imaalem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/03 15:23:12 by armendes          #+#    #+#              #
#    Updated: 2022/04/21 17:00:53 by imaalem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS =	main.c									\
		parsing/parsing.c						\
		parsing/check_quote_and_braces.c		\
		parsing/create_cmd_struct.c				\
		parsing/error.c							\
		parsing/free.c							\
		parsing/parsing_utils.c					\
		parsing/find_pipe.c						\
		parsing/cut_into_words.c				\
		parsing/create_word_struct.c			\
		parsing/empty_word.c					\
		parsing/concat_words.c					\
		parsing/search_utils.c					\
		parsing/search_error_redirection.c		\
		parsing/manage_redirection.c			\
		parsing/manage_redirection_utils.c		\
		parsing/manage_string.c					\
		parsing/create_cell_for_redirection.c	\
		parsing/get_infile_and_outfile.c		\
		parsing/get_var_env.c					\
		parsing/get_var_env_two.c				\
		parsing/get_env_utils.c					\
		parsing/trim_space_start_or_end.c		\
		parsing/create_args.c					\
		parsing/parsing_utils2.c				\
		parsing/put_space_env_var.c				\
		parsing/exit_status.c					\
		parsing/get_env.c						\
		parsing/just_dollar.c					\
		parsing/just_dollar_two.c				\
		parsing/just_dollar_three.c				\
		parsing/braces_error.c					\
		parsing/cut_dollars_from_env.c			\
		parsing/cut_dollars_from_env_two.c		\
		builtins/builtins.c						\
		builtins/echo.c							\
		builtins/cd.c							\
		builtins/pwd.c							\
		builtins/export.c						\
		builtins/export_two.c					\
		builtins/unset.c						\
		builtins/env.c							\
		builtins/exit.c							\
		builtins/exit_two.c						\
		execution/execution.c					\
		execution/parse_binary_path.c 			\
		execution/exec_utils.c					\
		execution/pipe_n_close.c				\
		execution/exec_binary_n_exec.c			\
		execution/dup2_n_redirections.c			\
		execution/redirections.c				\
		execution/new_get_next_line.c			\
		execution/here_doc.c					\
		execution/parse_path_utils.c			\
		execution/redirection_utils.c			\
		execution/signals.c						\

OBJS =	${SRCS:.c=.o}

LIB_DIR =	libs/gnl libs/libft

LIB_NAME =	libs/gnl/gnl.a libs/libft/libft.a

CC =	gcc

CFLAGS = -Wall -Wextra -Werror -I includes -I libs/gnl -I libs/libft -g

NAME =	minishell

RM =	rm -rf

all:	${NAME}

${NAME}:	${OBJS}
			make -C libs/libft
			make -C libs/gnl
			${CC} ${CFLAGS} -o ${NAME} ${OBJS} ${LIB_NAME} -lreadline

%.o : %.c
			${CC} ${CFLAGS} -o $@ -c $<

clean:
	make clean -C libs/libft
	make clean -C libs/gnl
	${RM} ${OBJS}

fclean:		clean
	${RM} ${NAME}

re:			fclean all

.PHONY:		all clean fclean re