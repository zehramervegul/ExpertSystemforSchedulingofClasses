
%*******************
% Facts


student(1,  cse341).
student(1,  cse343).
student(2,  cse341).
student(2,  cse331).
student(3,  cse343).
student(3,  cse331).
student(4,  cse341).
student(4,  cse321).
 
 % id, course id, needs
instructor(genc, cse341, projector).      
instructor(turker, cse343, smartboard).
instructor(bayrakci, cse331, no_need).
instructor(gozupek,  cse321, smartboard). 

% id, instructor, capacity, hour, room
course(cse341, genc, 10, 4, z06).       
course(cse343, turker, 10, 3, z11).
course(cse331, bayrakci, 10, 3, z06).
course(cse321, gozupek,  10, 4, z11).

% id, capacity, equipment
room(z06, 10, cse102, hcapped, projector ).
room(z11, 10, cse241, hcapped, smartboard).


%****************
% Rules


% Add intructor to course
 
add_instructor :-

	read(I),                    % reading instructor id
	read(C),                   % reading course id
			
	 course(C, _, _,_,_),
		assert( instructor(I,C) ),
		nl, write("Instructor "),  write(I), write(", "),  write("added to course "), write(C).
	
%******************


% Add new student to course
	
add_new_student :-

	read(I),                     % reading student id
	read(CI),                    % reading course id  
		
	
	 course(CI, _, _,_,_),  
	 course(CI,_,C,_,_),             % finding capacity       
	 C >	0 ->                % capacity control     
	 
		assert( student(I,CI) ),
		nl, write("Student "),  write(I), write(", "),  write("added to course "),  write(CI).

	
	
%********************
	
% Check which room can be assigned to a given class
	
room_assign_to_given_class :-
	
	read(C),              % reading course id
		
	 % course(C, _, _,_,_),
	 
		room(X, _, C, _,_),            % finding available room
		nl, write(X).
		
%********************		
	
% Check which room can be assigned to which classes
		
given_room_assign_to_which_class :-
	
		read(R),                % reading room id
	
		room(R, _, X,_ ,_),          % finding available classes forr given room
		nl, write(X).

%********************

% Check which classes a student can be assigned 

which_classes_can_be_assign :-	
	
	course(_,_,C,_,_),         % finding capacity 
	
	C > 0 ->     % capacity control
	
	
	
	course(X,_,C,_,_),       % finding course
	write(X).


%*********************

% Check a student can be enrolled to a given class

can_be_enrolled_a_given_class :-
	
	read(S),
	read(CI),

	course(CI,_,C,_,_),             % finding capacity 

	C >	0 ->                % capacity control

	assert( student(S, CI) ).

%**********************



