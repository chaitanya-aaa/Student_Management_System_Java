<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }

        .custom-container {
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-custom {
            transition: all 0.3s ease-in-out;
        }

        .btn-custom:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body class="bg-gradient-to-r from-cyan-200 to-blue-200 min-h-screen flex flex-col">

    <!-- Header -->
    <header class="bg-white shadow-md p-4 sticky top-0 z-50">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold text-blue-600">Student Management System</h1>
            <nav>
                <a href="#home" class="mx-3 text-blue-600 hover:underline">Home</a>
                <a href="#about" class="mx-3 text-blue-600 hover:underline">About</a>
                <a href="#contact" class="mx-3 text-blue-600 hover:underline">Contact</a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main id="home" class="flex-grow flex items-center justify-center py-20 custom-container">
        <div class="bg-white rounded-2xl shadow-lg p-10 text-center max-w-lg w-full mx-4">
            <h2 class="text-3xl font-semibold text-gray-800 mb-6">Welcome to our Portal</h2>
            <form action="login.jsp">
                <button class="btn btn-primary btn-custom w-full mb-4">Login</button>
            </form>
            <form action="register.jsp">
                <button class="btn btn-success btn-custom w-full">Register</button>
            </form>
        </div>
    </main>

    <section id="about" class="py-20 px-6 bg-white">
    <div class="container mx-auto max-w-4xl text-center">
        <h2 class="text-3xl font-bold mb-6 text-blue-600">About Us</h2>
       <div class="grid md:grid-cols-2 gap-8 text-gray-700 text-left">
    <!-- Student Details -->
    <div class="p-6 rounded-xl bg-gray-50 shadow-md hover:shadow-lg transition duration-300">
        <div class="mb-4 text-indigo-500">
            <svg class="w-10 h-10 mx-auto" fill="none" stroke="currentColor" stroke-width="1.5"
                 viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 14l9-5-9-5-9 5 9 5z"/>
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 14l6.16-3.422A12.083 12.083 0 0118 20.25H6a12.083 12.083 0 01-.16-9.672L12 14z"/>
            </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Student Details</h3>
        <p>Store and manage student records including name, email, course, and more.</p>
    </div>

    <!-- Fetch by ID/Email -->
    <div class="p-6 rounded-xl bg-gray-50 shadow-md hover:shadow-lg transition duration-300">
        <div class="mb-4 text-green-500">
            <svg class="w-10 h-10 mx-auto" fill="none" stroke="currentColor" stroke-width="1.5"
                 viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M15 12H9m6 4H9m2 4h2a2 2 0 002-2v-1m-6 3v-1a2 2 0 012-2h2a2 2 0 012 2v1"/>
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M15 9V5a3 3 0 00-6 0v4"/>
            </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Fetch by ID & Email</h3>
        <p>Retrieve student data instantly using student ID and email address.</p>
    </div>

    <!-- Update Student Details -->
    <div class="p-6 rounded-xl bg-gray-50 shadow-md hover:shadow-lg transition duration-300">
        <div class="mb-4 text-yellow-500">
            <svg class="w-10 h-10 mx-auto" fill="none" stroke="currentColor" stroke-width="1.5"
                 viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M15.232 5.232l3.536 3.536M9 13.5l6.732-6.732a2.121 2.121 0 113 3L12 16.5H9v-3z"/>
            </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Update Details</h3>
        <p>Modify student information to ensure your database is always current.</p>
    </div>

    <!-- Delete Student -->
    <div class="p-6 rounded-xl bg-gray-50 shadow-md hover:shadow-lg transition duration-300">
        <div class="mb-4 text-red-500">
            <svg class="w-10 h-10 mx-auto" fill="none" stroke="currentColor" stroke-width="1.5"
                 viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round"
                      d="M6 18L18 6M6 6l12 12"/>
            </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2">Delete Student</h3>
        <p>Remove student records from the system securely when needed.</p>
    </div>
</div>
       
    </div>
</section>
    
	<!-- Database work need to be done.., -->
    <section id="contact" class="py-20 px-6 bg-blue-50">
    <div class="container mx-auto max-w-4xl text-center">
        <h2 class="text-3xl font-bold mb-6 text-blue-700">Contact Us</h2>
        <p class="text-gray-700 mb-8">Have questions or feedback? We'd love to hear from you!</p>

        <div class="grid md:grid-cols-2 gap-10 text-left">
            <!-- Contact Info -->
            <div class="space-y-4">
                <div class="flex items-start space-x-4">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" stroke-width="1.5"
                         viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M2.25 6.75L12 13.5l9.75-6.75M3 17.25V6.75m0 10.5L12 20.25l9-2.25M3 17.25l9 2.25"/>
                    </svg>
                    <span>226m1a0507cse@bvcr.edu.in</span>
                </div>
                <div class="flex items-start space-x-4">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" stroke-width="1.5"
                         viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M3 8.25c0-.621.504-1.125 1.125-1.125h15.75c.621 0 1.125.504 1.125 1.125v7.5c0 .621-.504 1.125-1.125 1.125H4.125A1.125 1.125 0 013 15.75v-7.5z"/>
                    </svg>
                    <span>+91 9381354195</span>
                </div>
                <div class="flex items-start space-x-4">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" stroke-width="1.5"
                         viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M17.657 16.657L13.414 12l4.243-4.243M6.343 16.657L10.586 12 6.343 7.757"/>
                    </svg>
                    <span>123, Temple Street, Andhra Pradesh, India</span>
                </div>
            </div>

            <!-- Contact Form (non-functional but UI-ready) -->
            <form class="bg-white p-6 rounded-xl shadow-lg space-y-4">
                <input type="text" placeholder="Your Name" class="w-full p-3 rounded border border-gray-300 focus:outline-blue-400" required>
                <input type="email" placeholder="Your Email" class="w-full p-3 rounded border border-gray-300 focus:outline-blue-400" required>
                <textarea placeholder="Your Message" rows="4" class="w-full p-3 rounded border border-gray-300 focus:outline-blue-400" required></textarea>
                <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">Send Message</button>
            </form>
        </div>
    </div>
</section>
    

    <!-- Footer -->
    <footer class="bg-gray-800 text-white text-center py-4">
        &copy; 2025 Student Management System. All rights reserved.
    </footer>

    <!-- Scroll Animations using Tailwind -->
    <script>
        // Simple scroll animation using IntersectionObserver
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-fadeInUp');
                }
            });
        });

        document.querySelectorAll('section').forEach(section => {
            section.classList.add('opacity-0', 'transition-all', 'duration-1000');
            observer.observe(section);
        });
    </script>

    <!-- Custom Animation Classes using Tailwind's plugin syntax -->
    <style>
        .animate-fadeInUp {
            opacity: 1 !important;
            transform: translateY(0) !important;
        }

        section {
            transform: translateY(30px);
        }
    </style>
</body>
</html>
