CC 			=	cc
FLAGS 		=	-Wall -Werror -Wextra

DEBUG		=	-g

NAME 		=	push_swap
PRINTF		=	libftprintf.a

#---FILES and their directories---
#parent dir
SRC			=	src
INCLUDES	=	include

PRINTF_SRC	=	printf

LIBS		=	libs

LIBRARIES	=	-L./${LIBS} -lftprintf

#dir of operations displayed by the terminal
OPERATIONS_DIR		=	${SRC}/operations
OPERATIONS_FILES	=	${OPERATIONS_DIR}/push.c ${OPERATIONS_DIR}/reverse_rotate.c \
						${OPERATIONS_DIR}/rotate.c ${OPERATIONS_DIR}/swap.c \
						${OPERATIONS_DIR}/core_stack_methods.c

LIBFT_DIR			=	${SRC}/libft_funct
LIBFT_FILES			=	${LIBFT_DIR}/ft_atoi_err.c ${LIBFT_DIR}/ft_lst1.c ${LIBFT_DIR}/ft_lst2.c \
						${LIBFT_DIR}/ft_split.c ${LIBFT_DIR}/ft_substr.c

QUICK_SORT_DIR		=	${SRC}/quick_sort
QUICK_SORT_FILES	=	${QUICK_SORT_DIR}/quick_sort.c

#dir of the algorithms used to sort
SORT_ALGRTHM_DIR	=	${SRC}/sort_algorithms
SORT_ALGRTHM_FILES	=	${SORT_ALGRTHM_DIR}/sort_2.c ${SORT_ALGRTHM_DIR}/sort_3.c \
						${SORT_ALGRTHM_DIR}/sort_4.c ${SORT_ALGRTHM_DIR}/sort_5.c \
						${SORT_ALGRTHM_DIR}/push_swap.c ${SORT_ALGRTHM_DIR}/auxiliary_checks.c \
						${SORT_ALGRTHM_DIR}/sort_n.c ${SORT_ALGRTHM_DIR}/sort_n_auxiliary1.c \
						${SORT_ALGRTHM_DIR}/sort_n_auxiliary2.c ${SORT_ALGRTHM_DIR}/sort_n_auxiliary3.c

#dir of methods to create and clean the stacks and lists
STRCT_CREATN_DIR	=	${SRC}/struct_creation
STRCT_CREATN_FILES	=	${STRCT_CREATN_DIR}/clear_data.c ${STRCT_CREATN_DIR}/check_and_conv_arg.c \
						${STRCT_CREATN_DIR}/stack_methods.c \
						${STRCT_CREATN_DIR}/ptr_lst_methods1.c ${STRCT_CREATN_DIR}/ptr_lst_methods2.c

#dir of main used
MAIN_DIR			=	${SRC}/main
MAIN_FILES			=	${MAIN_DIR}/main.c

ALL_FILES			=	${OPERATIONS_FILES} ${SORT_ALGRTHM_FILES} ${STRCT_CREATN_FILES} ${QUICK_SORT_FILES} ${LIBFT_FILES} ${MAIN_FILES}
OBJS				=	${ALL_FILES:.c=.o}

HEADER				=	${INCLUDES}/push_swap.h

%.o: %.c ${HEADER} Makefile ${PRINTF}
	${CC} ${FLAGS} -I ${INCLUDES} -c $< -o $@ ${DEBUG}

# RULES

all: ${LIBS} ${PRINTF} ${NAME}

${PRINTF}:
	@make -C ${PRINTF_SRC}
	cp ${PRINTF_SRC}/${PRINTF} ${LIBS}

${NAME}: ${OBJS}
	${CC} $^ -o $@ ${LIBRARIES}
	@echo "Compilation with main of $@ succesfull"

${LIBS}:
	mkdir -p $@

clean:
	@rm -f ${OBJS}
	@make clean -C ${PRINTF_SRC}

fclean: clean
	@rm -f ${NAME}
	@make fclean -C ${PRINTF_SRC}
	@rm ${LIBS}/${PRINTF}

re: fclean all
	
.PHONY: all clean fclean re
