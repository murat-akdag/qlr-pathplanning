function [av_act] = available_actions(state,R)
    current_state_row = R(state,:);
    av_act=find(current_state_row>=0);
end

