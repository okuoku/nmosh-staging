#include <stdio.h>
#include <termios.h>
#include <sys/ioctl.h>

void
toggle(int i){
	struct termios t;
	tcgetattr(0,&t);
	if(i){
		t.c_lflag |= ECHO;
	}else{
		t.c_lflag &= (~ECHO);
	}
	tcsetattr(0,TCSANOW,&t);
}

void
echo_on(void){
	toggle(1);
}

void
echo_off(void){
	toggle(0);
}

/* hmm... */

void
can_toggle(int i){
	struct termios t;
	tcgetattr(0,&t);
	if(i){
		t.c_lflag |= ICANON;
	}else{
		t.c_lflag &= (~ICANON);
		t.c_cc[VTIME] = 0; /* input wait time = 0 */
		t.c_cc[VMIN] = 1;  /* buffer size = 1. wait at least 1 byte */
	}
	tcsetattr(0,TCSANOW,&t);
}

void
can_on(void){
	can_toggle(1);
}

void
can_off(void){
	can_toggle(0);
}

int
checkterminal(void){
	/* FIXME: check ANSI cap. */
	return isatty(1);
}

int
winsize_x(void){
	struct winsize w;
	ioctl(0,TIOCGWINSZ,&w);
	return w.ws_col;
}

int
winsize_y(void){
	struct winsize w;
	ioctl(0,TIOCGWINSZ,&w);
	return w.ws_row;
}



