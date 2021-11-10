function [next_action] = sample_next_action(available_actions_range)
    pos=randi(length(available_actions_range));
    next_action =available_actions_range(pos); 
end

