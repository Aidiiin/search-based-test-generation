
$algorithms = @("STANDARD_GA")
$crossOverFunctions = @("SINGLEPOINTRELATIVE", "UNIFORM", "DOUBLEPOINT")
$selectionFunctions = @("RANK", "ROULETTEWHEEL", "TOURNAMENT", "BESTK")
foreach ($al in $algorithms) {
  foreach ($sf in $selectionFunctions) {
    foreach ($cf in $crossOverFunctions) {
      for ($i = 1; $i -le 10; $i++) {
        java -jar ..\evosuite\master\target\evosuite-master-1.1.0.jar -Dconfiguration_id="$al-$sf-$cf" -Djunit_check=false -Dsearch_budget=30 -Djunit_tests=false -generateSuite -Dalgorithm="$al" -Dcrossover_function="$cf" -Dselection_function="$sf" -Dcriterion="branch" -target ./lib/target/classes -Doutput_variables="configuration_id,TARGET_CLASS,criterion,Coverage,Size,Length,MutationScore,Total_Goals,Covered_Goals,Lines,Covered_Lines,Total_Methods,Covered_Methods,Fitness_Evaluations,Total_Time,algorithm,ranking_type,crossover_rate,mutation_rate,search_budget,crossover_function,selection_function";
      }
    }
  }
}

