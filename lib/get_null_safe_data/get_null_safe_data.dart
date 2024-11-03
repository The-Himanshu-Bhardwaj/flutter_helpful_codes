// RETURNS DESIRED VALUE IF DATA FROM API IS BLANK OR NULL

String getNullSafeString(String? data, String returnValue) {

  try {

    // WHEN DATA IS NULL
    if (data == null) return returnValue;

    // WHEN DATA IS BLANK
    if (data.isEmpty) {
      return returnValue;
    }

    // WHEN DATA IS AVAILABLE
    else {
      return data.trim();
    }

  } catch (e) {
    return returnValue;
  }

}


int getNullSafeInt(int? data, int returnValue) {

  try {


    if (data == null) return returnValue;
    return data;

  } catch (e) {
    return returnValue;
  }

}

double getNullSafeDouble(String? data, double returnValue) {

  try {

    if (data == null) return returnValue;

    if (data.isEmpty) {
      return returnValue;
    } else {
      return double.tryParse(data) ?? 0;
    }

  } catch (e) {
    return returnValue;
  }

}
