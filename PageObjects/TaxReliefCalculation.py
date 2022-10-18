# Importing the required functions to calculate age
from datetime import date, datetime


# Function to get the tax relief value
def getTaxReliefValue(sal, strTaxPaid, dob, gender):
    # salary = int(sal)
    # taxPaid = int(strTaxPaid)
    salary = float(sal)
    taxPaid = float(strTaxPaid)
    # taxRelief = 0
    # variable = 0
    # genderBonus = 0

    # Getting age using getAge function
    age = getAge(dob)
    # Getting variable using getVariable function
    variable = getVariable(age)

    if gender == 'M' or gender == 'm':
        genderBonus = 0
    else:
        genderBonus = 500

    taxRelief = ((salary - taxPaid) * variable) + genderBonus

    if taxRelief < 50:
        taxRelief = 50.00

    format_float = "{:.2f}".format(taxRelief)
    print(format_float)
    return format_float


# COMMAND ----------

# Importing the required functions to calculate age
# from datetime import date, datetime


# Function to get the age based on dob

def getAge(born):
    format_date = '%d%M%Y'
    # converting string date to actual date format
    dob = datetime.strptime(born, format_date)
    # getting today's date
    today = date.today()
    # returning age as integer
    return today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))


# COMMAND ----------

# Function to get the ageVariable based on age
def getVariable(age):
    ageVariable = 0
    if age <= 18:
        ageVariable = 1.00
    elif 18 < age <= 35:
        ageVariable = 0.80
    elif 35 < age <= 50:
        ageVariable = 0.50
    elif 50 < age <= 75:
        ageVariable = 0.367
    elif age > 75:
        ageVariable = 0.05
    # returning ageVariable
    return ageVariable

# COMMAND ----------

# testing the results for Female
# getTaxReliefValue("1687458", "3658", "12061985", "F")
# print(getTaxReliefValue("1687458", "3658", "12061985", "F"))
# COMMAND ----------

# testing the results for Male
# getTaxReliefValue("1687458", "3658", "12061985", "M")
