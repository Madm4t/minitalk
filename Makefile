CLIENT	= client
SERVER	= server

LIBFTPRINTF		= ./resource/ft_printf/libftprintf.a
LIBFTPRINTF_DIR	= ./resource/ft_printf

LIBFT		= ./resource/libft/libft.a
LIBFT_DIR	= ./resource/libft

SRC_S	= server.c
SRC_C	= client.c

OBJ_S	= $(SRC_S:.c=.o)
OBJ_C	= $(SRC_C:.c=.o)

CC		= gcc
CFLAGS	= -Wall -Wextra -Werror

all : $(LIBFT) $(LIBFTPRINTF) $(SERVER) $(CLIENT)

$(SERVER) : $(OBJ_S) minitalk.h
	@ $(CC) $(CFLAGS) -o $@ $(OBJ_S) $(LIBFT) $(LIBFTPRINTF)
	@printf "server ready. \n"

$(CLIENT) : $(OBJ_C) minitalk.h
	@ $(CC) $(CFLAGS) -o $@ $(OBJ_C) $(LIBFT) $(LIBFTPRINTF)
	@printf "client ready. \n"

$(LIBFTPRINTF) :
	@ $(MAKE) -C $(LIBFTPRINTF_DIR)

$(LIBFT) :
	@ $(MAKE) -C $(LIBFT_DIR)
	@ $(MAKE) bonus -C $(LIBFT_DIR)

%.o : %.c
	@ $(CC) $(CFLAGS) -c $< -o $@


clean :
	@ $(MAKE) clean -C $(LIBFTPRINTF_DIR)
	@ $(MAKE) clean -C $(LIBFT_DIR)
	@ rm -rf $(OBJ_S) $(OBJ_C)
	@ printf "object files removed.\n"

fclean : clean
	@ $(MAKE) fclean -C $(LIBFTPRINTF_DIR)
	@ $(MAKE) fclean -C $(LIBFT_DIR)
	@ rm -rf $(SERVER) $(CLIENT)
	@printf "client removed.\n"
	@printf "server removed.\n"

re	: fclean
	$(MAKE) all

.PHONY: all clean fclean re