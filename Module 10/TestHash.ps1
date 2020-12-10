# The following example is borrowed from
# https://docs.microsoft.com/en-us/powershell/scripting/samples/selecting-items-from-a-list-box?view=powershell-6

#Step1	Loading two .NET framework classes, System.Drawing and System.Windows.Forms. 
#       This will provide a blank UI window (canvas) where you can add UI components.
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

#Step2  After you create an instance of the Form class (canvas), assign values to three properties of this class.
#  * Text: This becomes the title of the window.
#  * Size: This is the size of the form, in pixels. 
#          The preceding script creates a form that’s 300 pixels wide by 200 pixels tall.
#  * StartingPosition: This optional property is set to CenterScreen in the preceding script. 
#                      If you don’t add this property, Windows selects a location when the form is opened. 
#                      By setting the StartingPosition to CenterScreen, you’re automatically 
#                      displaying the form in the middle of the screen each time it loads.
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select a Computer'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

#Step3  Next, create an OK button for your form. Specify the size and behavior of the OK button. 
#       In this example, the button position is 120 pixels from the form’s top edge, and 75 pixels from the left edge. 
#       The button height is 23 pixels, while the button length is 75 pixels. The script uses 
#       predefined Windows Forms types to determine the button behaviors.
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,120)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

#Step4  You can create a Cancel button. The Cancel button is 120 pixels from the top, but 150 pixels from the left edge of the window.
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,120)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

#Step5  Next, provide label text on your window that describes the information you want 
#       users to provide. In this case, you want users to select a computer.
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Please select a computer:'
$form.Controls.Add($label)

#Step6   Add the control (in this case, a list box) that lets users provide the 
#        information you’ve described in your label text. There are many other 
#        controls you can apply besides list boxes.
$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

#Step7   Now you can populate the entries for the dialog box, let's add 7
[void] $listBox.Items.Add('atl-dc-001')
[void] $listBox.Items.Add('atl-dc-002')
[void] $listBox.Items.Add('atl-dc-003')
[void] $listBox.Items.Add('atl-dc-004')
[void] $listBox.Items.Add('atl-dc-005')
[void] $listBox.Items.Add('atl-dc-006')
[void] $listBox.Items.Add('atl-dc-007')

#Step8   Add the list box control to your form, and instruct Windows to 
#        open the form atop other windows and dialog boxes when it’s opened.
$form.Controls.Add($listBox)
$form.Topmost = $true

#Step9   Add the following line of code to display the form in Windows.
$result = $form.ShowDialog()

#Step 10 Finally, the code inside the If block instructs Windows what to do with the form after users 
#        select an option from the list box, and then click the OK button or press the Enter key.
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem         # this is the input selection made by the user
    Write-Host $x "is selected."       # print the choice to the screen
}


