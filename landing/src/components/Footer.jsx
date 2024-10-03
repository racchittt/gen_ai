import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <div className='bg-[#f0f0f0]'>
      {/* Flex Container */}
      <div className='container flex flex-col-reverse justify-between px-6 py-10 mx-auto space-y-8 md:flex-row md:space-y-0'>
        {/* Logo and social links container */}
        <div className='flex flex-col-reverse items-center justify-between space-y-12 md:flex-col md:space-y-0 md:items-start'>
          <div className='mx-auto my-6 text-center text-[#16a1a8] md:hidden'>
            Copyright © 2024, All Rights Reserved
          </div>
          {/* Logo */}
          <div>
            <img src='otter.gif' className='h-8' alt='Company Logo' />
            <p className='text-xl font-bold'>Vayu </p>
          </div>
          {/* Social Links Container */}
        </div>
        {/* List Container */}
        <div className='flex justify-around space-x-32'>
          <div className='flex flex-col space-y-3 text-[#16a1a8]'>
            <Link to='/' className='hover:text-[#11757b]'>
              Home
            </Link>
            <Link to='/' className='hover:text-[#11757b]'>
              Resources
            </Link>
            <Link to='/' className='hover:text-[#11757b]'>
              About Us
            </Link>
            <Link to='/' className='hover:text-[#11757b]'>
              Contact Us
            </Link>
          </div>
          <div className='flex flex-col space-y-3 text-[#16a1a8]'>
            <Link to='/' className='hover:text-[#11757b]'>
              Community
            </Link>
            <Link to='/' className='hover:text-[#11757b]'>
              Terms of Service
            </Link>
            <Link to='/' className='hover:text-[#11757b]'>
              Privacy Policy
            </Link>
          </div>
        </div>

        {/* Input Container */}
        <div className='flex flex-col justify-between'>
          <form>
            <div className='flex space-x-3'>
              <input
                type='email' // Change input type to email for better user experience
                className='flex-1 px-4 rounded-full focus:outline-none w-full'
                placeholder='Subscribe for updates in your inbox'
              />
              <button className='px-6 py-2 text-white rounded-full bg-[#16a1a8] hover:bg-[#11757b] focus:outline-none'>
                Subscribe
              </button>
            </div>
          </form>
          <div className='hidden text-black md:block'>
            Copyright © 2024, All Rights Reserved
          </div>
        </div>
      </div>
    </div>
  );
};

export default Footer;
