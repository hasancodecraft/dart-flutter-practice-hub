void main(){
  List<String> allStudentList = ['Hasan', 'Hossain', 'Abdullah', 'Hasan', 'Nimmi','Jeba'];
  List<String> presentStudents = ['Hasan', 'Hossain', 'Abdullah'];
  List<String> checkPresent = [];
  List<String> checkAbsent = [];

  for (int i = 0; i < allStudentList.length; i++){
    for (int j  = 0; j < presentStudents.length; j++){
      if (allStudentList[i] == presentStudents[j] ){ 
        if (!checkPresent.contains(allStudentList[i])){ // Remove duplicate values
        checkPresent.add(allStudentList[i]);}
        break;
      } else if (j == presentStudents.length - 1) {
  if (!checkAbsent.contains(allStudentList[i])) {
    checkAbsent.add(allStudentList[i]);
  }
}
    }
  }

  print("Checked present students: $checkPresent");
  print("Checked absent students: $checkAbsent");
}