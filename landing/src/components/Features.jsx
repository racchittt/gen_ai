import React from "react";

const Features = () => {
  return (
    <section id="features">
      {/* Flex Container */}
      <div className="flex flex-col">
      <h2 className="text-4xl font-bold text-center pt-16">
          <span className="text-[#0CADB5]">Pepo</span> in your Pocket.
        </h2>
        <div className="container  flex flex-col px-4 mx-auto mt-20 space-y-12 md:space-y-0 md:flex-row">
          {/* What's Different */}
          <div className="flex flex-col space-y-12 md:w-1/2 items-center">
            <video
              src="Pepoo.mp4"
              className="w-1/2"
              autoPlay
              loop
              muted
              controls={false}
            />
          </div>

          {/* Numbered List */}
          <div className="flex flex-col space-y-8 md:w-1/2">
            {/* List Item 1 */}
            <div className="flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row">
              {/* Heading */}
              <div className="rounded-l-full bg-brightRedSupLight md:bg-transparent">
                <div className="flex items-center space-x-2">
                  <div className="px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]">
                    01
                  </div>
                  <h3 className="text-base font-bold md:mb-4 md:hidden">
                    Tailored Mental Health Resources
                  </h3>
                </div>
              </div>

              <div>
                <h3 className="hidden mb-4 text-lg font-bold md:block">
                  Tailored Mental Health Resources
                </h3>
                <p className="text-darkGrayishBlue">
                  Our platform provides curated resources based on users' moods
                  and challenges. From articles to expert tips, we offer tools
                  that help users manage their mental health.
                </p>
              </div>
            </div>

            {/* List Item 2 */}
            <div className="flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row">
              {/* Heading */}
              <div className="rounded-l-full bg-brightRedSupLight md:bg-transparent">
                <div className="flex items-center space-x-2">
                  <div className="px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]">
                    02
                  </div>
                  <h3 className="text-base font-bold md:mb-4 md:hidden">
                    Real-Time Chat Support
                  </h3>
                </div>
              </div>

              <div>
                <h3 className="hidden mb-4 text-lg font-bold md:block">
                  Real-Time Chat Support
                </h3>
                <p className="text-darkGrayishBlue">
                  Users can chat with our AI-powered mental health assistant
                  Pepo :) or connect with therapists for immediate support. Our
                  chat service is available 24/7 to provide timely help.
                </p>
              </div>
            </div>

            {/* List Item 3 */}
            <div className="flex flex-col space-y-3 md:space-y-0 md:space-x-6 md:flex-row">
              {/* Heading */}
              <div className="rounded-l-full bg-brightRedSupLight md:bg-transparent">
                <div className="flex items-center space-x-2">
                  <div className="px-4 py-2 text-white rounded-full md:py-1 bg-[#0CADB5]">
                    03
                  </div>
                  <h3 className="text-base font-bold md:mb-4 md:hidden">
                    Meditation and Breathing Practices
                  </h3>
                </div>
              </div>

              <div>
                <h3 className="hidden mb-4 text-lg font-bold md:block">
                  Meditation and Breathing Practices
                </h3>
                <p className="text-darkGrayishBlue">
                  With our meditation and breathing features, you can now have
                  someone participating in your mental health journey!
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Features;
