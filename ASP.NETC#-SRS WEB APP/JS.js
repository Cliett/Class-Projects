$(document).ready(function LoginFadeIn() {
    $('#testPic').hide().fadeIn(2000);
    $('#RequestLabel').hide().fadeIn(2000);
    $('#userLabel').hide().fadeIn(2000);
    $('#userBox').hide().fadeIn(2000);
    $('#passLabel').hide().fadeIn(2000);
    $('#passBox').hide().fadeIn(2000);
    $('#loginButton').hide().fadeIn(2000);
    
});
$(function MainMenuFadeIn() {
    $('#Image1').hide().fadeIn(2000);
    $('#mainpageWelcome').hide().fadeIn(2000);
    $('#ButtonNewRequest').hide().delay(200).fadeIn(2000);
    $('#ButtonViewSavedRequests').hide().delay(400).fadeIn(2000);
    $('#ButtonViewSubmittedRequests').hide().delay(600).fadeIn(2000);
    $('#ButtonUpdateEmployees').hide().delay(800).fadeIn(2000);
    $('#ButtonReviewRequests').hide().delay(1000).fadeIn(2000);
    //The delays kind of give a cool effect like each button loads one right after another
});
$(function EditRequestFadeIn() {
    $('#editRequestFormMainData').hide().fadeIn(2000);
    $('#editRequestFormCheckBoxData').hide().fadeIn(2000);
    $('#editRequestFormTopRightText').hide().fadeIn(2000);
    $('#editRequestFormBottomButtons').hide().fadeIn(2000);
});

$(function HRFormFadeIn() {
    $('#listboxFormPanelText').hide().fadeIn(2000);
    $('#listboxFormPanelButtons').hide().fadeIn(2000);
    $('#listboxFormPanel').hide().fadeIn(2000);
});