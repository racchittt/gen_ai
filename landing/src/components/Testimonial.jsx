import React from 'react';

const Tetimonial = () => {
  return (
    <section id='app-screenshots'>
      {/* Container for heading and screenshots */}
      <div className='max-w-6xl px-5 mx-auto mt-32 text-center'>
        {/* Heading */}
        <h2 className='text-4xl font-bold text-center'>
          Take a Look at Our App
        </h2>

        {/* Screenshot Container */}
        <div className='flex flex-col mt-24 md:flex-row md:space-x-6'>
          {/* Screenshot 1 */}
          <div className='flex flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:w-1/3'>
            <img 
              src='appSs1.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 1' 
            />
            <h5 className='text-lg font-bold'>Main Dashboard</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Get an overview of your progress and access all features from the main dashboard.
            </p>
          </div>

          {/* Screenshot 2 */}
          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appSs2.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 2' 
            />
            <h5 className='text-lg font-bold'>Track Your Mood</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Our app allows you to easily track your daily mood and get insights over time.
            </p>
          </div>

          {/* Screenshot 3 */}
          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appSs1.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 3' 
            />
            <h5 className='text-lg font-bold'>Therapist Chat</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Chat with our therapy bot or connect with real therapists within the app.
            </p>
          </div>
        </div>

        {/* Button */}
        <div className='my-16'>
          <a
            href='#'
            className='p-3 px-6 pt-2 text-white bg-[#0CADB5] rounded-full baseline hover:bg-brightRedLight'
          >
            Download Now
          </a>
        </div>
      </div>
    </section>
  );
};

export default Tetimonial;
