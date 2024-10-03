import React from 'react';

const Tetimonial = () => {
  return (
    <section id='app-screenshots'>
      {/* Container for heading and screenshots */}
      <div className='max-w-6xl px-5 mx-auto mt-32 text-center'>
        {/* Heading */}
        <h2 className='text-4xl font-bold text-center'>
          How do we deal with it? in GenZ style 😎
        </h2>

        <div className='flex flex-col mt-24 md:flex-row md:space-x-6'>
          <div className='flex flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:w-1/3'>
            <img 
              src='appSs1.jpeg'
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 1' 
            />
            <h5 className='text-lg font-bold'>Kickstart with Calm Vibes ✨</h5>
            <p className='text-sm text-darkGrayishBlue'>
              When things get too much, we got you covered! Start your journey with our welcoming dashboard and track your daily feels.
            </p>
          </div>

          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appSs2.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 2' 
            />
            <h5 className='text-lg font-bold'>Mood-o-Meter: Check Yourself 🧠</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Our mood tracker is on point! It's like journaling but faster. Track your ups and downs, see what sparks joy.
            </p>
          </div>

          {/* Screenshot 3 */}
          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appsS3.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 3' 
            />
            <h5 className='text-lg font-bold'>Meditate Like a Pro 🧘‍♀️</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Need a break? Get into the zone with guided meditations. Whether it’s 2 minutes or 20, we’ve got your mental health routine covered.
            </p>
          </div>
        </div>

        <div className='flex flex-col mt-24 md:flex-row md:space-x-6'>
          {/* Screenshot 4 */}
          <div className='flex flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:w-1/3'>
            <img 
              src='appsS4.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 4' 
            />
            <h5 className='text-lg font-bold'>Get Pro Help Anytime 🧑‍⚕️</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Talk to real therapists or our therapy bot whenever you're feeling low. It's like texting, but better.
            </p>
          </div>

          {/* Screenshot 5 */}
          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appsS5.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 5' 
            />
            <h5 className='text-lg font-bold'>Crush CBT Tests Like a Boss 💪</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Mental health is a journey. Take custom Cognitive Behavioral Therapy tests and get insights on how you can improve daily.
            </p>
          </div>

          {/* Screenshot 6 */}
          <div className='hidden flex-col items-center p-6 space-y-6 rounded-lg bg-veryLightGray md:flex md:w-1/3'>
            <img 
              src='appsS6.jpeg' 
              className='w-[80%] h-auto rounded-xl' 
              alt='App Screenshot 6' 
            />
            <h5 className='text-lg font-bold'>Daily Vibes: Help Cards 💌</h5>
            <p className='text-sm text-darkGrayishBlue'>
              Sometimes, all you need is a little boost. Get random help cards tailored to your mood – because we all need reminders to chill.
            </p>
          </div>
        </div>

        {/* Button */}
        <div className='my-16'>
          <p className='mb-4'>And that’s just the start! Get SOS alerts, journaling tools, communities, and more 🤩</p>
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
