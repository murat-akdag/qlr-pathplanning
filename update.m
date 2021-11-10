function [out] = update(current_state, action, gamma,R,Q)
     max_value=max(Q(action,:));
     out=R(current_state, action) + gamma * max_value;
end

