/*
float percentage0 = .35;
float percentage1 = .13;
float percentage2 = .95;
float percentage3 = .79;
float percentage4 = .64;

//average of percentage
float total = percentage0 + percentage1 + percentage2 + percentage3 + percentage4;
println(total / 5);
*/

float[] percentages = new float[5];
percentages[0] = .35;
percentages[1] = .13;
percentages[2] = .95;
percentages[3] = .79;
percentages[4] = .64;
/*
float total = percentages[0] + percentages[1] + percentages[2] + percentages[3] + percentages[4];
println(total / percentages.length);
*/

float total = 0;
for (int index=0; index < percentages.length; index++) {
  total += percentages[index];
}
println(total/percentages.length);