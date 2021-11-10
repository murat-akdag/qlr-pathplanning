clc;
clear;

reward= [-1  -1  -1  -1   0  -1;
         -1  -1  -1   0  -1   100;
         -1  -1  -1   0  -1  -1;
         -1   0   0  -1   0  -1;
          -1  0  0   -1  -1   100;
	     -1   0  -1  -1   0   100];

Q=zeros(6,6);

gamma = 0.8;

for i=1:10000
    current_state=randi(size(Q,1));
    available_act=available_actions(current_state,reward);
    action=sample_next_action(available_act);
    Q(current_state,action)=update(current_state,action,gamma,reward,Q);  
end

disp('Q Table: ');
disp(100*Q/max(Q(:)));

%% Test

current_state=3;
idx=1;
steps(idx)=current_state;

while current_state ~= 6
    next_step_index = find(Q(current_state,:) == max(Q(current_state,:)));
    
    if length(next_step_index) > 1
        next_step_index = next_step_index(randi(length(next_step_index)));
    else
        next_step_index = next_step_index;
    end
    
    idx=idx+1;
    steps(idx)=next_step_index;
    
    current_state = next_step_index;
end

 disp('Path: ');
 disp(steps);
 