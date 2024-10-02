import React from 'react';

const Features = () => {
  return (
    <section id='features'>
      {/* Flex Container */}
      <div className='container  flex flex-col px-4 mx-auto mt-28 space-y-12 md:space-y-0 md:flex-row'>
        {/* What's Different */}
        <div className='flex flex-col space-y-12 md:w-1/2'>
          <h2 className='max-w-md text-4xl font-bold text-center md:text-left'>
            What Makes Our Platform Unique?
          </h2>
          <p className='max-w-sm text-center text-darkGrayishBlue md:text-left'>
            Our platform is designed to provide personalized mental health support. 
            It's built to connect users with resources, tools, and professionals seamlessly, 
            catering to their emotional and psychological well-being.
          </p>
        </div>

        {/* Numbered List */}
        <div className='flex flex-col space-y-8 md:w-1/2'>
          {/* List Item 1 */}
          <div className='flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row'>
            {/* Heading */}
            <div className='rounded-l-full bg-brightRedSupLight md:bg-transparent'>
              <div className='flex items-center space-x-2'>
                <div className='px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]'>
                  01
                </div>
                <h3 className='text-base font-bold md:mb-4 md:hidden'>
                  Tailored Mental Health Resources
                </h3>
              </div>
            </div>

            <div>
              <h3 className='hidden mb-4 text-lg font-bold md:block'>
                Tailored Mental Health Resources
              </h3>
              <p className='text-darkGrayishBlue'>
                Our platform provides curated resources based on users' moods and challenges. 
                From articles to expert tips, we offer tools that help users manage their mental health.
              </p>
            </div>
          </div>

          {/* List Item 2 */}
          <div className='flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row'>
            {/* Heading */}
            <div className='rounded-l-full bg-brightRedSupLight md:bg-transparent'>
              <div className='flex items-center space-x-2'>
                <div className='px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]'>
                  02
                </div>
                <h3 className='text-base font-bold md:mb-4 md:hidden'>
                  Real-Time Chat Support
                </h3>
              </div>
            </div>

            <div>
              <h3 className='hidden mb-4 text-lg font-bold md:block'>
                Real-Time Chat Support
              </h3>
              <p className='text-darkGrayishBlue'>
                Users can chat with our AI-powered mental health assistant or connect with therapists 
                for immediate support. Our chat service is available 24/7 to provide timely help.
              </p>
            </div>
          </div>

          {/* List Item 3 */}
          <div className='flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row'>
            {/* Heading */}
            <div className='rounded-l-full bg-brightRedSupLight md:bg-transparent'>
              <div className='flex items-center space-x-2'>
                <div className='px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]'>
                  03
                </div>
                <h3 className='text-base font-bold md:mb-4 md:hidden'>
                  Mood Tracking & Insights
                </h3>
              </div>
            </div>

            <div>
              <h3 className='hidden mb-4 text-lg font-bold md:block'>
                Mood Tracking & Insights
              </h3>
              <p className='text-darkGrayishBlue'>
                Our mood tracking feature allows users to log their emotions and 
                receive insights on their mental health trends. This helps users better understand their emotional patterns.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Features;
