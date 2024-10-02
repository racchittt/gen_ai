import { Link } from 'react-router-dom';

const CallToAction = () => {
  return (
    <section id='cta' className='bg-[#0CADB5]'>
      {/* Flex Container */}
      <div className='container flex flex-col items-center justify-between px-6 py-24 mx-auto space-y-12 md:py-12 md:flex-row md:space-y-0'>
        {/* Heading */}
        <h2 className='text-5xl font-bold leading-tight text-center text-white md:text-4xl md:max-w-xl md:text-left'>
          Take the first step towards better mental well-being
        </h2>
        {/* Button */}
        <div>
          <Link
            to='/chat' // Assuming a route like this exists in your app
            className='p-3 px-6 pt-2 text-[#0CADB5] bg-white rounded-full shadow-2xl baseline hover:bg-gray-900 hover:text-white'
          >
            Start Your Journey
          </Link>
        </div>
      </div>
    </section>
  );
};

export default CallToAction;
