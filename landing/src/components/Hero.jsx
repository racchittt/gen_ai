import { Link } from 'react-router-dom';

const Hero = () => {
  return (
    <section id='hero'>
      {/* Flex Container */}
      <div className='container flex flex-col-reverse justify-between items-start px-6 mx-auto mt-10 space-y-0 md:space-y-0 md:flex-row'>
        {/* Left Item */}
        <div className='flex flex-col mb-32 my-auto space-y-12 md:w-2/3'>
          <h1 className='max-w-xl text-4xl font-bold text-center md:text-5xl md:text-left'>
            Being GenZ can be tough.
          </h1>
          <p className='max-w-md text-center text-gray-500 md:text-left'>
            Manage your mental health with Vayu. Chat, Medidate, Breathe, read blogs, communicate and many more!
          </p>
          <div className='flex gap-2 justify-center md:justify-start'>
            <Link
              to='/chat'
              className='p-3 px-6 text-white bg-[#0CADB5] rounded-full baseline hover:bg-[#00949c]'
            >
              Chat with Pepo !
            </Link>
            <Link
              to='https://github.com/racchittt/gen_ai'
              className='p-3 px-6 text-[#0CADB5] border-[#0CADB5] border-2  rounded-full baseline hover:bg-green-100'
            >
              Download now
            </Link>
          </div>
        </div>
        {/* Image */}
        <div className='md:w-1/3 flex items-center'>
          <img src='welcome.svg' className='' alt='' />
        </div>
      </div>
    </section>
  );
};

export default Hero;
