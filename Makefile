# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: Damien <dbauduin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/28 15:20:22 by Damien            #+#    #+#              #
#    Updated: 2018/01/28 15:20:35 by Damien           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include .misc/make/color
include .misc/make/paths
include .misc/make/misc_var

.SILENT	: __START	NAME	clean fclean all re object library os_dep libft
.PHONY	: __START			clean fclean all re object library os_dep libft

.DEFAULT_GOAL = __START

PROJECT	=	FT_PRINTF

CC		?=	clang
CC_FLAG ?=	-Werror \
						-Wall	\
						-Wextra

CC_FLAG++	?=		-Werror \
								-Wall	\
								-Wextra \
								-g -fsanitize=leak \

INCLUDE = include

MAIN	?=	main.c
NAME	?=	libftprintf.a

SRC		= $(SRC_W)

OBJ		:=	$(notdir $(SRC:.c=.o))

OBJ_P	=	$(addprefix $(P_OBJ)/,$(OBJ))

__START: os all
	 printf "$(OK)[+][$(PROJECT)] Done$(C_DEF)\n"

all: $(NAME)

$(NAME):  $(SRC)
	@make -C ./libft
	@make library --no-print-directory

clean:
	@make -C ./libft clean
	rm		-f	$(OBJ_W)
	printf	"$(WARN)[!][$(PROJECT)] Removed all objects from obj$(C_DEF)\n"

fclean:		clean
	make -C libft fclean
	rm		-f	$(NAME)
	printf	"$(OK)[+][$(PROJECT)] Fully cleaned$(C_DEF)\n"

re:			fclean all

object:	$(SRC) $(P_SRC) $(P_OBJ)
	$(foreach SOURCE, $(SRC), \
		$(CC) $(CC_FLAG) -I$(P_INCLUDE) -I libft/include -c $(SOURCE) -o $(P_OBJ)/$(notdir $(SOURCE:.c=.o)) && \
		printf "$(OK)[+][$(PROJECT)] $(SOURCE)$(C_DEF)" && sleep $(SLEEP)	&& \
		printf "\r\033[K" \
	;)
	printf "$(OK)[+][$(PROJECT)] Objects are made in $(C_DEF)\n"

library:	object $(P_OBJ) $(OBJ_P)
	printf "$(WARN)[!][$(PROJECT)] Creating archive $(NAME)$(C_DEF)\n"
	@ar rc $(NAME) $(OBJ_W)
	printf "$(WARN)[!][$(PROJECT)] Generating index in $(NAME)$(C_DEF)\n"
	@ranlib $(NAME)
	printf "$(OK)[+][$(PROJECT)] The $(NAME) library was made$(C_DEF)\n"
