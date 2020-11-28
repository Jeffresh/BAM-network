numbers = ['1', '2', '3'];
n_numbers = length(numbers);

for i=1:n_numbers
    p{i} = text2im(numbers(i));
end

figure;
for i=1:n_numbers
    subplot(1,3,i),imagesc(p{i});
end

[height, width] = size(p{1})

X = zeros(n_numbers, height * width);

for i=1:n_numbers
    X(i,:) = p{i}(:)';
end

# change values to interval [-1, 1]
X = 2 * X - 1;

# Binary representation of 1, 2 3
Y=[-1 -1 1; -1 1 -1; 1 1 -1];

%Calculo de W.
W = encode(X, Y);

for i=1: n_numbers
    p_salt_pepper{i} = imnoise(p{i}, 'salt & pepper', 0.2);
end

figure;
for i=1:n_numbers
    subplot(1,3,i),imagesc(p_salt_pepper{i});
end

for i=1:n_numbers
    X_noise(i,:) = p_salt_pepper{i}(:)';
end

# change values to interval [-1, 1]
X_noise = 2 * X_noise - 1;
Y_predict = decode(X_noise,Y,W)
Y