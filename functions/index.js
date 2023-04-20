'use strict';

const functions = require('firebase-functions');
const nodemailer = require('nodemailer');
const gmailEmail = functions.config().gmail.email;
const gmailPassword = functions.config().gmail.password;
const mailTransport = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: gmailEmail,
    pass: gmailPassword
  }
});

const APP_NAME = 'Seiken Martial Arts app';

exports.sendWelcomeEmail = functions.auth.user().onCreate(event => {
  const user = event.data; // The Firebase user.

  const email = 'seikendojo1@gmail.com' // The email of Seiken Dojo.
  const userEmail = user.email; // The email of the user.
  const displayName = user.displayName; // The display name of the user.

  return sendWelcomeEmail(email, userEmail, displayName);
});

// Sends a welcome email to the given user.
function sendWelcomeEmail(email, userEmail, displayName) {
  const mailOptions = {
    from: `${APP_NAME} <noreply@firebase.com>`,
    to: email
  };

  // The user subscribed to the newsletter.
  mailOptions.subject = `New User Added to ${APP_NAME}!`;
  mailOptions.text = `Hey Sensei Siamak!\nA new student with ${userEmail} has just signed up on ${APP_NAME}.\nPlease have a look and see if you need to change his/her role.`;
  return mailTransport.sendMail(mailOptions).then(() => {
    console.log('New user email sent to:', email);
  });
}
