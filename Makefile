CC = cc

NAME = minishell

CFLAGS = -Wall -Werror -Wextra -g #-fsanitize=address

GSRCS = global_utils/decide.c global_utils/env_scout.c global_utils/ft_calloc.c			  \
		global_utils/ft_strcmp.c global_utils/ft_strjoin.c global_utils/ft_strlcpy.c	  \
		global_utils/ft_strlen.c global_utils/ft_substr.c global_utils/ft_strchr.c		  \
		global_utils/ft_strdup.c global_utils/ft_isalnum.c global_utils/ft_isalpha.c 	  \
		global_utils/ft_isascii.c global_utils/ft_isdigit.c global_utils/ft_isprint.c	  \
		global_utils/ft_putchar_fd.c  global_utils/ft_putendl_fd.c  global_utils/ft_atoi.c\
		global_utils/ft_putnbr_fd.c  global_utils/ft_putstr_fd.c global_utils/ft_itoa.c

TEXP  = ted-dafi/expansion/expan.c ted-dafi/expansion/re_join.c ted-dafi/expansion/get_exp.c \
		ted-dafi/expansion/quote_rm.c ted-dafi/expansion/empty_value.c

TSRCS = $(TEXP) ted-dafi/split_list.c ted-dafi/parsing.c ted-dafi/list_func.c

MSRCS = mohamed/error_managment.c mohamed/exit_code.c 	mohamed/ft_pstrjoin.c \
		mohamed/get_next_line/get_next_line.c 			mohamed/get_next_line/get_next_line_utils.c \
		mohamed/here_docs.c mohamed/redirections.c 		mohamed/redirections_lst_utils.c\
		mohamed/lst_functions/ft_lstadd_back_bonus.c  	mohamed/lst_functions/ft_lstadd_front_bonus.c \
		mohamed/lst_functions/ft_lstlast_bonus.c		mohamed/here_doc_expand.c\
		mohamed/lst_functions/ft_lstnew_bonus.c			mohamed/lst_functions/ft_lstsize_bonus.c	\
		mohamed/global_error_var.c						mohamed/big_one_cleaner.c \
		mohamed/here_doc_q_remov.c						mohamed/redirects_processing.c \

SRCS =  main.c $(TSRCS) $(MSRCS) $(GSRCS)

OBJS = $(SRCS:.c=.o)

RM = rm -f

all: $(NAME)

$(NAME):	$(OBJS)
#		$(CC) $(CFLAGS) -lreadline -L /Users/msouiyeh/goinfre/.brew/opt/readline/lib  $(OBJS) -o $(NAME)
		$(CC) $(CFLAGS) -lreadline -L /Users/$(USER)/.brew/opt/readline/lib  $(OBJS) -o $(NAME)

clean:
		$(RM) $(OBJS) $(B_OBJS)

fclean: clean
		$(RM) $(NAME) $(B_NAME)

re: fclean all

.PHONY: all clean fclean re bonus
