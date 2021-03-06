*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu_name}                            prebudget
${download_dropdown}                    //span[@class='ant-dropdown-trigger']//i
${download_worksheet_xpath}             //app-download-worksheet[@id='download_worksheet_btn']
${download_excel_xpath}                 //li[@id='download_template_btn']

${upload_button}                        //app-upload-template[@id='upload_worksheet_btn']

${file_upload_block}                    document.getElementById('upload_file-chooser').getElementsByTagName('input')[0].style.display='block'
${file_upload_none}                     document.getElementById('upload_file-chooser').getElementsByTagName('input')[0].style.display='none'
${worksheet_difference_tab_xpath}           //app-upload-worksheet/div/mat-horizontal-stepper/div[1]/mat-step-header[2]/div[3]
${worksheet_submit_tab_xpath}           //app-upload-worksheet/div/mat-horizontal-stepper/div[1]/mat-step-header[3]
${submit_to_database_upload_button}     //mat-horizontal-stepper//button//span
${notify_after_upload}                  //nz-notification/div/div/div/div/div[1]
${backdrop_click}                       document.getElementsByClassName('cdk-overlay-backdrop')[0].click()
${save_button}                          //i[@id='template_save_btn']
${yes_button}                           //button[@id='confirm_save']
${no_button}                            //button[@id='confirm_dismiss']

${template_refresh}                     //i[@id='template_refresh_btn']

${history_button}                       //budget-treetable-capex/div[1]/app-button-on-template/span/nz-dropdown[2]
${click_latest_history}                 //div[@class='cdk-overlay-container']//li[1]
${first_row_table_history}              //app-history/div[2]/div/ejs-treegrid/div[2]/div[3]/div/table/tbody/tr[1]

${guideline_button}                     //app-budget-guideline-template[@id='guidleline_btn']
${guideline_xpath}                      //mat-dialog-container[@id='mat-dialog-0']
${close_guideline_button}               //mat-dialog-container[@id="mat-dialog-0"]/app-view-guideline/div/span/button

${simulation_button}                    //span//i[@id='simulation_dialog_btn']
${yes_before_simulation_button}         //nz-modal/div/div[2]/div/div/div[3]/button[2]
${no_before_simulation_button}          //nz-modal/div/div[2]/div/div/div[3]/button[1]

${no_simulation_button}                 //button[@id='confirm_dismiss']//span
${yes_simulation_button}                //button[@id='confirm_save']//span

${radio_button_click_fixedAsset}        //nz-radio-group/label[1]/span[2]
${radio_button_click_netProfit}         //nz-radio-group/label[2]/span[2]

${click_view_remarks}                   //app-template-remark[@id='remark_btn']
${click_view_remarks_branch_1}          //app-remark-dialog/div[1]/div/div/div[1]/div[2]/button[2]
${test_message_click}                   //div[@id='type_msg']
${test_message_placeholder}             xpath=//textarea[@placeholder='Remark']
${send_remarks_button}                  //div[@id='type_msg']/i

${approve_button_unitl_complete_execution_log_xpath}     //nz-tag[contains(text(), "completed")]
${approve_click_execution_log}                          //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/a

${ok_approve_button_click_xpath}                        //div[@class="ant-popover-buttons"]//button[2]
${cancel_simulation_inside_execution_log_xpath}         //div[@class="ant-popover-buttons"]//button[1]

${download_prebudget_result_xpath}                      //app-execution-log/nz-table/nz-spin/div/div/div/div/div[2]/table/tbody/tr[1]/td[9]/span/a
*** Keywords ***

Download Dropdown Button
#   Dropdown Button
    Wait Until Element Is Visible       ${download_dropdown}
    click element    ${download_dropdown}
    sleep   1s

Download Worksheet Template
    Download Dropdown Button
#   Download Worksheet
    Wait Until Element Is Visible   ${download_worksheet_xpath}
    click element   ${download_worksheet_xpath}
    sleep   5s

Download Excel Template
    Download Dropdown Button
#   Download Excel
    Wait Until Element Is Visible      ${download_excel_xpath}
    click element     ${download_excel_xpath}
    sleep   2s


Upload Worksheet
    [Arguments]    ${upload_cpx}
    Download Dropdown Button
    sleep    1s
#   Upload Button
    Wait Until Element Is Visible      ${upload_button}
    click element    ${upload_button}
    sleep   1s
# file gets upload
    Execute Javascript    ${file_upload_block}
    input text  xpath=//label[@id='upload_file-chooser']//input    ${upload_cpx}
    Execute Javascript    ${file_upload_none}
    sleep   1s

Upload worksheet difference tab
    click element   ${worksheet_difference_tab_xpath}
    sleep       1s
# Upload worksheet submit tab
    click element       ${worksheet_submit_tab_xpath}
    sleep   2s

#    [Arguments]    ${id_step_label}
#    click element   xpath=//mat-step-header[@id='cdk-step-label-${id_step_label}-1']
#    sleep       1s
## Upload worksheet submit tab
#    click element       xpath=//mat-step-header[@id='cdk-step-label-${id_step_label}-2']
#    sleep   2s



Upload submit to database
    WAIT UNTIL ELEMENT IS VISIBLE    ${submit_to_database_upload_button}
    click element        ${submit_to_database_upload_button}
    sleep    2s
    wait until element is not visible    ${notify_after_upload}
    Execute javascript  ${backdrop_click}
    sleep   1s


Save Button
    Wait Until Element Is Visible      ${save_button}
    click element    ${save_button}
    sleep   2s
#   Yes confirm save

Yes button
    Wait until element is visible    ${yes_button}
    click element       ${yes_button}
    sleep   5s

No button
    Wait until element is visible    ${no_button}
    click element       ${no_button}
    sleep   5s

Monthly tab
   [Arguments]    ${template_id}
    Wait until element is visible    //button[@id='month_view_tab_${template_id}']
    click element       //button[@id='month_view_tab_${template_id}']
    sleep   2s

Yearly tab
   [Arguments]    ${template_id}
    Wait until element is visible    //button[@id='year_view_tab_${template_id}']
    click element       //button[@id='year_view_tab_${template_id}']
    sleep   2s

Refresh Button
    wait until element is visible   ${template_refresh}
    click element    ${template_refresh}
    sleep    2s


History Button
    wait until element is visible    ${history_button}
    click element    ${history_button}
    sleep   2s
    click element    ${click_latest_history}
    wait until element is visible    ${first_row_table_history}
    sleep    2s


Guideline Button
    wait until element is visible    ${guideline_button}
    click element    ${guideline_button}
    sleep    2s
    #-- box of guideline
    wait until element is visible    ${guideline_xpath}
    click button    ${close_guideline_button}
    sleep    1s



Simulation Button
    sleep    2s
    Wait Until Element Is Visible       ${simulation_button}
    click element   ${simulation_button}
    sleep    5s

Click rules simulation
   [Arguments]    ${rule}=fixedAsset
    RUN KEYWORD IF      '${rule}'=='fixedAsset'    Click FixedAsset
    ...      ELSE       Click NetProfit
    log to console    ${rule}
    sleep    2s

#-- Ok  button for before simulation
    WAIT UNTIL ELEMENT IS VISIBLE    ${yes_before_simulation_button}
    click element    ${yes_before_simulation_button}
    sleep   5s


# -- NO  button for before simulation
#    WAIT UNTIL ELEMENT IS VISIBLE    ${no_before_simulation_button}
#    click element    ${no_before_simulation_button}
#    sleep   2s
#

No simulation
    Wait Until Element Is Visible    ${no_simulation_button}}
    click element   ${no_simulation_button}

Yes simulation
    Wait Until Element Is Visible    ${yes_simulation_button}
    click element    ${yes_simulation_button}
    sleep    2s


Click FixedAsset
    # -- Based on fixed assets
    WAIT UNTIL ELEMENT IS VISIBLE    ${radio_button_click_fixedAsset}
    click element    ${radio_button_click_fixedAsset}
    sleep   2s

Click NetProfit
    # -- Based on net profit
    WAIT UNTIL ELEMENT IS VISIBLE    ${radio_button_click_netProfit}
    click element    ${radio_button_click_netProfit}
    sleep   2s



Validate test Remarks to branch 1
    Click to View remarks and chat menu
    Type test messages in view remarks
    send button
    backdrop

#-- for  view  remarks
Click to View remarks and chat menu
    wait until element is visible    ${click_view_remarks}
    click element    ${click_view_remarks}
    sleep   2s
    click element    ${click_view_remarks_branch_1}

Type test messages in view remarks
    wait until element is visible    ${test_message_click}
    click element    ${test_message_click}
    sleep    2s
    input text    ${test_message_placeholder}     testing123

send button
    wait until element is visible   ${send_remarks_button}
    click element    ${send_remarks_button}
    sleep    3s

backdrop
    Execute javascript  ${backdrop_click}



Template history drop down
    wait until element is not visible    xpath=//div[@class='ant-notification-notice-message']
    click element    xpath=//app-budget-treetable-income-expenses/div[1]/app-button-on-template/span/nz-dropdown[2]
    sleep   1s
#-- error    wait until element is not visible   xpath=//div[@class='cdk-overlay-container']//li[1]
#    click element   xpath=//div[@class='cdk-overlay-container']//li[1]
#    sleep    2s



Approve click simulation
# -- approve click
    wait until element is not visible   ${approve_button_unitl_complete_execution_log_xpath}
    click element    ${approve_click_execution_log}
    sleep   1s
Ok button to approve simualtion
#-- ok approve click
    wait until element is visible   ${ok_approve_button_click_xpath}
    click element        ${ok_approve_button_click_xpath}
    sleep   2s
Cancel approve simulation
# --  cancel click
    wait until element is visible   ${cancel_simulation_inside_execution_log_xpath}
    click button   ${cancel_simulation_inside_execution_log_xpath}
    sleep    2s

Download prebudget result
# -- download prebudget
    wait until element is visible    ${download_prebudget_result_xpath}
    click element    ${download_prebudget_result_xpath}
    sleep    2s
