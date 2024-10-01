const expressWinston = require('express-winston');
const winston = require('winston');


const logger = winston.createLogger({
    transports: [
      new winston.transports.Console({
        json: true,
        colorize:true
      }),
    ]
  });

// this is for logging 
expressWinston.requestWhitelist.push('body');
expressWinston.responseWhitelist.push('body');

const winstonLogger = expressWinston.logger({
  winstonInstance: logger,
  meta: false, // optional: log meta data about the request (default: true)
  msg: "HTTP {{req.method}} {{req.url}} {{req.statusCode}} {{req.responseTime}}ms {{req.ip}}", // optional: customize the logging message
  // expressFormat: true, // optional: use the default Express/morgan format
  colorize: false, // optional: colorize the log output
});

const errorLogger = expressWinston.errorLogger({
    winstonInstance: logger,
  })

module.exports = {winstonLogger, errorLogger};