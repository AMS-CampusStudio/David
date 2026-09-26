<!DOCTYPE html>
<html lang="nl" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="HOUTWERK.NL - Meesters in Hout & Maatwerk">
    <meta property="og:title" content="HOUTWERK.NL | Meesters in Hout & Maatwerk">
    
    <title>HOUTWERK.NL | Meesters in Hout & Maatwerk</title>
    
    <!-- Tailwind via CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    
    <!-- Confetti Library -->
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.2/dist/confetti.browser.min.js"></script>
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    },
                    animation: {
                        'slow-zoom': 'zoom 25s infinite alternate',
                        'fade-in-up': 'fadeInUp 1s ease-out forwards',
                        'modal-in': 'modalIn 0.5s cubic-bezier(0.16, 1, 0.3, 1) forwards',
                    },
                    keyframes: {
                        zoom: {
                            '0%': { transform: 'scale(1)' },
                            '100%': { transform: 'scale(1.15)' },
                        },
                        fadeInUp: {
                            '0%': { opacity: '0', transform: 'translateY(40px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' },
                        },
                        modalIn: {
                            '0%': { opacity: '0', transform: 'scale(0.95) translateY(20px)' },
                            '100%': { opacity: '1', transform: 'scale(1) translateY(0)' },
                        }
                    }
                }
            }
        }
    </script>

    <style>
        body { 
            background-color: #0f0f0f; 
            color: #fff; 
            overflow-x: hidden;
        }
        
        .glass {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .glass-heavy {
            background: rgba(15, 15, 15, 0.85);
            backdrop-filter: blur(24px);
            -webkit-backdrop-filter: blur(24px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .hero-title {
            font-size: clamp(3rem, 10vw, 8.5rem);
            line-height: 0.85;
            letter-spacing: -0.05em;
        }

        .text-stroke {
            -webkit-text-stroke: 1px rgba(255,255,255,0.6);
            color: transparent;
        }

        .hover-lift { transition: all 0.5s cubic-bezier(0.16, 1, 0.3, 1); }
        .hover-lift:hover { 
            transform: translateY(-12px); 
            background: rgba(132, 146, 121, 0.08);
            border-color: rgba(132, 146, 121, 0.3);
            cursor: pointer;
        }

        .hover-lift:active {
            transform: scale(0.98);
        }

        /* Utility for Scroll Animation */
        .reveal-on-scroll {
            opacity: 0;
            transform: translateY(30px);
            transition: all 1s ease-out;
        }
        .reveal-on-scroll.is-visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* FAQ Accordion Transitions */
        .faq-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-track { background: #0f0f0f; }
        ::-webkit-scrollbar-thumb { background: #333; border-radius: 4px; }
        ::-webkit-scrollbar-thumb:hover { background: #849279; }

        .nav-link { position: relative; }
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 1px;
            background: #849279;
            transition: width .3s ease;
        }
        .nav-link:hover::after { width: 100%; }
        
        /* Utility for aspect ratios */
        .aspect-4-5 { aspect-ratio: 4/5; }

        /* Modal specific */
        .modal-overlay {
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.4s ease;
        }
        .modal-overlay.active {
            opacity: 1;
            pointer-events: auto;
        }
        .modal-content-container {
            transform: scale(0.95) translateY(20px);
            opacity: 0;
            transition: all 0.5s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .modal-overlay.active .modal-content-container {
            transform: scale(1) translateY(0);
            opacity: 1;
        }

        .detail-item {
            opacity: 0;
            transform: translateY(10px);
            transition: all 0.5s ease;
        }
        .modal-overlay.active .detail-item {
            opacity: 1;
            transform: translateY(0);
        }

        /* Levitating Animation */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        .animate-float { animation: float 6s ease-in-out infinite; }
        .animate-float-delayed-1 { animation: float 7s ease-in-out infinite 1s; }
        .animate-float-delayed-2 { animation: float 8s ease-in-out infinite 2s; }
        .animate-float-delayed-3 { animation: float 9s ease-in-out infinite 0.5s; }
    </style>
</head>
<body class="antialiased selection:bg-[#849279] selection:text-white">

    <!-- Navigation -->
    <nav class="fixed w-full z-[100] px-4 md:px-8 py-6 transition-all duration-300" id="navbar">
        <div class="max-w-7xl mx-auto flex justify-between items-center glass rounded-full px-6 md:px-10 py-4 shadow-2xl">
            <a href="#" class="font-black text-xl tracking-tighter uppercase flex items-center gap-1 hover:opacity-80 transition-opacity">
                HOUTWERK<span class="text-[#849279] text-2xl leading-none">.</span>NL
            </a>
            
            <div class="hidden md:flex space-x-10 text-[10px] font-bold uppercase tracking-[0.2em]">
                <a href="#about" class="nav-link hover:text-[#849279] transition-colors">Over Ons</a>
                <a href="#process" class="nav-link hover:text-[#849279] transition-colors">Expertise</a>
                <a href="#projects" class="nav-link hover:text-[#849279] transition-colors">Projecten</a>
                <a href="#faq" class="nav-link hover:text-[#849279] transition-colors">FAQ</a>
                <a href="#contact" class="nav-link hover:text-[#849279] transition-colors">Contact</a>
            </div>

            <div class="flex items-center gap-4">
                <a href="#contact" id="nav-offerte-btn" class="bg-white text-black px-6 py-2.5 rounded-full text-[10px] font-black uppercase tracking-widest hover:bg-[#849279] hover:text-white transition-all duration-500 transform hover:scale-105 active:scale-95 shadow-lg shadow-white/10">
                    Offerte
                </a>
                <button id="menu-toggle" class="md:hidden text-white p-1 hover:text-[#849279] transition-colors">
                    <svg id="menu-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-7 h-7">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 9h16.5m-16.5 6.75h16.5" />
                    </svg>
                </button>
            </div>
        </div>
    </nav>

    <!-- Mobile Menu Overlay -->
    <div id="mobile-menu" class="fixed inset-0 bg-[#0f0f0f] z-[90] flex flex-col justify-center items-center translate-x-full transition-transform duration-500 ease-[cubic-bezier(0.16,1,0.3,1)] md:hidden">
        <div class="flex flex-col items-center space-y-8 text-3xl font-black uppercase italic tracking-tighter">
            <a href="#about" onclick="toggleMenu()" class="hover:text-[#849279] hover:translate-x-2 transition-all">Over Ons</a>
            <a href="#process" onclick="toggleMenu()" class="hover:text-[#849279] hover:translate-x-2 transition-all">Expertise</a>
            <a href="#projects" onclick="toggleMenu()" class="hover:text-[#849279] hover:translate-x-2 transition-all">Projecten</a>
            <a href="#faq" onclick="toggleMenu()" class="hover:text-[#849279] hover:translate-x-2 transition-all">FAQ</a>
            <a href="#contact" onclick="toggleMenu()" class="hover:text-[#849279] hover:translate-x-2 transition-all">Contact</a>
        </div>
    </div>

    <!-- Hero Section -->
    <section class="relative h-screen min-h-[700px] flex flex-col justify-center items-center px-6 overflow-hidden">
        <div class="absolute inset-0 z-0">
            <div class="absolute inset-0 bg-gradient-to-b from-[#0f0f0f]/80 via-[#0f0f0f]/40 to-[#0f0f0f] z-10"></div>
            <!-- Custom User Image -->
            <img src="https://cdn.prod.website-files.com/694bd03981d80d5bd70499b1/694be81a21f9d47dbb83f994_Untitled%20(1920%20x%20600%20px)%20(1620%20x%201200%20px)%20(1920%20x%20600%20px)%20(1620%20x%201080%20px)%20(1620%20x%20880%20px).jpg" 
                 class="w-full h-full object-cover opacity-60 animate-slow-zoom" 
                 alt="Strakke gietvloer garage">
        </div>
        
        <div class="relative z-10 max-w-7xl w-full pt-10">
            <div class="animate-fade-in-up">
                <span class="inline-block py-1 px-3 border border-white/20 rounded-full text-[10px] font-bold tracking-[0.2em] uppercase mb-6 bg-black/20 backdrop-blur-md">Est. 2010</span>
                <h1 class="hero-title font-black italic uppercase text-white mb-8">
                    Modern<br>
                    <span class="text-stroke">Vakmanschap.</span>
                </h1>
                <p class="max-w-xl text-lg md:text-2xl text-gray-300 font-light leading-relaxed mb-12 border-l-2 border-[#849279] pl-6">
                    Exclusief timmerwerk voor wie oog heeft voor detail. Van op maat gemaakte kastenwanden tot complexe renovaties.
                </p>
                <div class="flex flex-col sm:flex-row gap-5">
                    <a href="#projects" class="bg-[#849279] hover:bg-[#a3b198] text-white px-10 py-5 rounded-sm font-bold uppercase tracking-[0.2em] text-xs transition-all duration-300 shadow-xl shadow-[#849279]/20 text-center">
                        Bekijk Projecten
                    </a>
                    <a href="#about" class="group border border-white/20 hover:border-[#849279] px-10 py-5 rounded-sm font-bold uppercase tracking-[0.2em] text-xs transition-all duration-300 text-center flex items-center justify-center gap-3">
                        Onze Filosofie
                        <span class="group-hover:translate-x-1 transition-transform">→</span>
                    </a>
                </div>
            </div>
        </div>

        <div class="absolute bottom-10 left-1/2 -translate-x-1/2 flex flex-col items-center gap-4 opacity-40 animate-bounce">
            <span class="text-[10px] uppercase tracking-[0.3em] font-bold">Scroll</span>
            <div class="w-px h-12 bg-white"></div>
        </div>
    </section>

    <!-- Mission Section -->
  <section id="about" class="pt-32 pb-20 px-6 bg-[#0f0f0f]">
        <div class="max-w-7xl mx-auto">
            <div class="grid md:grid-cols-2 gap-20 items-center">
                <div class="reveal-on-scroll">
                    <h2 class="text-[#849279] text-xs font-bold tracking-[0.4em] uppercase mb-6 flex items-center gap-3">
                        <span class="w-8 h-px bg-[#849279]"></span> Wie wij zijn
                    </h2>
                    <h3 class="text-4xl md:text-6xl font-black italic uppercase tracking-tighter mb-8 leading-none">
                        Geen massaproductie.<br>Wel aandacht.
                    </h3>
                    <div class="space-y-6 text-gray-400 text-lg leading-relaxed">
                        <p>In een tijd van snelle bouw en prefab oplossingen, kies ik voor de traditionele weg. Hout leeft, werkt en vraagt om inzicht dat je niet uit een boekje leert.</p>
                        <p>Als zelfstandig timmerman sta ik voor directe communicatie, een schone werkplek en afspraken die worden nagekomen. Ik denk mee vanaf de eerste schets tot de laatste schroef.</p>
                    </div>
                </div>
                <div class="relative reveal-on-scroll" style="transition-delay: 200ms;">
                    <div class="aspect-[4/5] overflow-hidden rounded-2xl">
                        <!-- Custom User Image -->
                        <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf65dc054957a6f35a95f_pexels-ebrubodyy-19977087.jpg"
                             onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?auto=format&fit=crop&q=80&w=1000';" 
                             class="w-full h-full object-cover grayscale hover:grayscale-0 transition-all duration-700 hover:scale-105" 
                             alt="Vakmanschap gietvloer applicatie">
                    </div>
                    <div class="absolute -bottom-10 -left-10 glass p-8 rounded-2xl hidden lg:block max-w-xs shadow-2xl">
                        <p class="text-[#849279] font-black text-4xl mb-2">15+</p>
                        <p class="text-xs uppercase tracking-widest font-bold opacity-70 text-gray-300">Jaar passie voor handgemaakt vakmanschap</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Owner / Founder Section (NEW) -->
    <section class="py-20 px-6 bg-[#0f0f0f] relative overflow-hidden">
        <div class="max-w-7xl mx-auto relative z-10">
            <div class="glass rounded-3xl p-8 md:p-16 flex flex-col md:flex-row items-center gap-12 reveal-on-scroll border border-[#849279]/20">
                <!-- Owner Image -->
                <div class="w-full md:w-1/3">
                    <div class="aspect-[3/4] relative rounded-2xl overflow-hidden border border-white/10 group shadow-2xl">
                        <!-- Custom Owner Image -->
                        <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf6ad75b44d9338378cc4_pexels-kseniachernaya-5691553.jpg" 
                             class="w-full h-full object-cover filter grayscale group-hover:grayscale-0 transition-all duration-700 transform group-hover:scale-105" 
                             alt="Eigenaar FLŌRŌ">
                        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
                    </div>
                </div>
                
                <!-- Owner Content -->
                <div class="w-full md:w-2/3 text-left">
                    <span class="text-[#849279] text-xs font-bold tracking-[0.4em] uppercase mb-4 block flex items-center gap-2">
                        <span class="w-6 h-px bg-[#849279]"></span> De Oprichter
                    </span>
                    
                    <h3 class="text-3xl md:text-5xl font-black italic uppercase mb-6 leading-tight">
                        "Perfectie zit in<br>de <span class="text-stroke">details.</span>"
                    </h3>
                    <div class="space-y-6 text-gray-400 font-light text-lg leading-relaxed max-w-2xl">
                        <p>
                            Mijn naam is <span class="text-white font-medium">Hans de Hout</span>. Wat begon als een passie voor hout en constructie, is uitgegroeid tot een missie om timmerwerk van het allerhoogste niveau te realiseren.
                        </p>
                        <p>
                            Ik ben persoonlijk betrokken bij elk project, van het eerste adviesgesprek tot de laatste polijstbeurt. Geen massaproductie, maar ambachtelijk vakwerk met oog voor uw specifieke woonwensen.
                        </p>
                    </div>

                    <!-- Levitating Trust Badges -->
                    <div class="flex flex-wrap gap-4 mt-8 mb-8">
                        <div class="animate-float glass px-5 py-3 rounded-full border border-[#849279]/50 flex items-center gap-3 text-[10px] font-black uppercase tracking-widest text-white shadow-[0_0_15px_rgba(132,146,121,0.2)] hover:shadow-[0_0_25px_rgba(132,146,121,0.4)] transition-shadow duration-500 cursor-default bg-[#849279]/10 backdrop-blur-md">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="#849279" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12c0 1.268-.63 2.39-1.593 3.068a3.745 3.745 0 01-1.043 3.296 3.745 3.745 0 01-3.296 1.043A3.745 3.745 0 0112 21c-1.268 0-2.39-.63-3.068-1.593a3.746 3.746 0 01-3.296-1.043 3.745 3.745 0 01-1.043-3.296A3.745 3.745 0 013 12c0-1.268.63-2.39 1.593-3.068a3.745 3.745 0 011.043-3.296 3.746 3.746 0 013.296-1.043A3.746 3.746 0 0112 3c1.268 0 2.39.63 3.068 1.593a3.746 3.746 0 013.296 1.043 3.746 3.746 0 011.043 3.296A3.745 3.745 0 0121 12z" />
                            </svg>
                            VCA Gecertificeerd
                        </div>
                        <div class="animate-float-delayed-1 glass px-5 py-3 rounded-full border border-[#849279]/50 flex items-center gap-3 text-[10px] font-black uppercase tracking-widest text-white shadow-[0_0_15px_rgba(132,146,121,0.2)] hover:shadow-[0_0_25px_rgba(132,146,121,0.4)] transition-shadow duration-500 cursor-default bg-[#849279]/10 backdrop-blur-md">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="#849279" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m0-10.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.249-8.25-3.286zm0 13.036h.008v.008H12v-.008z" />
                            </svg>
                            Volledig Verzekerd
                        </div>
                        <div class="animate-float-delayed-2 glass px-5 py-3 rounded-full border border-[#849279]/50 flex items-center gap-3 text-[10px] font-black uppercase tracking-widest text-white shadow-[0_0_15px_rgba(132,146,121,0.2)] hover:shadow-[0_0_25px_rgba(132,146,121,0.4)] transition-shadow duration-500 cursor-default bg-[#849279]/10 backdrop-blur-md">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="#849279" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                            </svg>
                            Persoonlijk Aanspreekpunt
                        </div>
                        <div class="animate-float-delayed-3 glass px-5 py-3 rounded-full border border-[#849279]/50 flex items-center gap-3 text-[10px] font-black uppercase tracking-widest text-white shadow-[0_0_15px_rgba(132,146,121,0.2)] hover:shadow-[0_0_25px_rgba(132,146,121,0.4)] transition-shadow duration-500 cursor-default bg-[#849279]/10 backdrop-blur-md">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="#849279" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z" />
                            </svg>
                            Tevredenheidsgarantie
                        </div>
                    </div>

                    <!-- Signature / Contact Button -->
                    <div class="mt-8 pt-8 border-t border-white/10 flex flex-col sm:flex-row items-start sm:items-center gap-6">
                        <div class="text-xl text-[#849279] font-black tracking-widest uppercase opacity-80">
                           Hans de Hout
                        </div>
                        <a href="#contact" class="text-xs font-bold uppercase tracking-widest hover:text-[#849279] transition-colors flex items-center gap-2 group">
                            Maak een afspraak
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4 group-hover:translate-x-1 transition-transform">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Decorative background element -->
        <div class="absolute top-0 right-0 w-1/2 h-full bg-[#849279]/5 blur-[100px] rounded-full pointer-events-none"></div>
    </section>

    <!-- Expertise Section (Updated) -->
    <section id="process" class="py-32 px-6 bg-black/40 relative">
        <div class="max-w-7xl mx-auto">
            <div class="text-center mb-24 reveal-on-scroll">
                <h2 class="text-[#849279] text-xs font-bold tracking-[0.4em] uppercase mb-4">Onze Expertise</h2>
                <h3 class="text-4xl md:text-5xl font-black uppercase italic">Vind de perfecte basis.</h3>
                <p class="mt-4 text-gray-500 text-sm tracking-widest uppercase">Klik op een service voor details</p>
            </div>

            <div class="grid lg:grid-cols-3 gap-8">
                <!-- Service 1 -->
                <div onclick="openDetail('woonbeton')" class="glass p-12 rounded-3xl hover-lift group border-l-4 border-l-transparent hover:border-l-[#849279] reveal-on-scroll cursor-pointer relative overflow-hidden">
                    <div class="absolute inset-0 bg-[#849279]/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                    <div class="relative z-10">
                        <div class="w-16 h-16 bg-[#849279]/10 rounded-2xl flex items-center justify-center mb-8 group-hover:bg-[#849279] transition-colors duration-500">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 group-hover:text-white transition-colors text-[#849279]">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 21h19.5m-18-18v14.25A2.25 2.25 0 0 0 4.5 19.5h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25Z" />
                            </svg>
                        </div>
                        <h3 class="text-2xl font-black uppercase mb-4 group-hover:text-[#849279] transition-colors flex items-center justify-between">
                            Maatwerk Interieur
                            <span class="opacity-0 group-hover:opacity-100 transition-opacity text-sm font-normal text-[#849279]">Details &rarr;</span>
                        </h3>
                        <p class="text-gray-400 leading-relaxed font-light">Unieke kastenwanden, inloopkasten en ensuite-oplossingen. Wij vertalen uw ruimte naar functioneel design met een perfecte afwerking.</p>
                    </div>
                </div>
                <!-- Service 2 -->
                <div onclick="openDetail('pu')" class="glass p-12 rounded-3xl hover-lift group border-l-4 border-l-transparent hover:border-l-[#849279] reveal-on-scroll cursor-pointer relative overflow-hidden" style="transition-delay: 100ms;">
                    <div class="absolute inset-0 bg-[#849279]/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                    <div class="relative z-10">
                        <div class="w-16 h-16 bg-[#849279]/10 rounded-2xl flex items-center justify-center mb-8 group-hover:bg-[#849279] transition-colors duration-500">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 group-hover:text-white transition-colors text-[#849279]">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9.53 16.122l9.37-9.445m-1.187 9.255l.706.707m-7.469-7.47l.706.707M6 6h.008v.008H6V6zm0 6h.008v.008H6V12zm0 6h.008v.008H6V18zm6-12h.008v.008H12V6zm0 6h.008v.008H12V12zm0 6h.008v.008H12V18zm6-12h.008v.008H18V6zm0 6h.008v.008H18V12z" />
                            </svg>
                        </div>
                        <h3 class="text-2xl font-black uppercase mb-4 group-hover:text-[#849279] transition-colors flex items-center justify-between">
                            Ambachtelijk Houtwerk
                             <span class="opacity-0 group-hover:opacity-100 transition-opacity text-sm font-normal text-[#849279]">Details &rarr;</span>
                        </h3>
                        <p class="text-gray-400 leading-relaxed font-light">Van massief eiken tafels tot handgemaakte deuren. Puur vakmanschap voor wie houdt van de warme, natuurlijke uitstraling van echt hout.</p>
                    </div>
                </div>
                <!-- Service 3 -->
                <div onclick="openDetail('industrieel')" class="glass p-12 rounded-3xl hover-lift group border-l-4 border-l-transparent hover:border-l-[#849279] reveal-on-scroll cursor-pointer relative overflow-hidden" style="transition-delay: 200ms;">
                    <div class="absolute inset-0 bg-[#849279]/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>
                    <div class="relative z-10">
                        <div class="w-16 h-16 bg-[#849279]/10 rounded-2xl flex items-center justify-center mb-8 group-hover:bg-[#849279] transition-colors duration-500">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 group-hover:text-white transition-colors text-[#849279]">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
                            </svg>
                        </div>
                        <h3 class="text-2xl font-black uppercase mb-4 group-hover:text-[#849279] transition-colors flex items-center justify-between">
                            Renovatie & Restauratie
                             <span class="opacity-0 group-hover:opacity-100 transition-opacity text-sm font-normal text-[#849279]">Details &rarr;</span>
                        </h3>
                        <p class="text-gray-400 leading-relaxed font-light">Herstel van authentieke details zoals kozijnen, trappen en ornamenten. Wij combineren traditionele technieken met de duurzaamheid van nu.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Detailed Modal Overlay -->
    <div id="detail-modal" class="modal-overlay fixed inset-0 z-[200] flex items-center justify-center px-4 md:px-8 py-8 backdrop-blur-sm bg-black/60">
        <div class="modal-content-container relative w-full max-w-5xl h-full max-h-[85vh] glass-heavy rounded-3xl overflow-hidden shadow-2xl flex flex-col md:flex-row">
            
            <!-- Close Button -->
            <button onclick="closeDetail()" class="absolute top-6 right-6 z-50 p-2 bg-black/50 hover:bg-[#849279] rounded-full text-white transition-colors duration-300 group">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-6 h-6 group-hover:rotate-90 transition-transform">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>

            <!-- Image Side -->
            <div class="w-full md:w-5/12 relative h-64 md:h-auto overflow-hidden">
                <div class="absolute inset-0 bg-gradient-to-t from-[#0f0f0f] to-transparent opacity-60 z-10"></div>
                <img id="modal-image" src="" alt="Detail" class="w-full h-full object-cover transform scale-105 transition-transform duration-[1.5s]">
                <div class="absolute bottom-8 left-8 z-20">
                     <span class="text-[#849279] text-[10px] font-bold tracking-[0.4em] uppercase mb-2 block">Specificaties</span>
                     <h3 id="modal-title-short" class="text-3xl font-black uppercase italic tracking-tighter text-white"></h3>
                </div>
            </div>

            <!-- Content Side -->
            <div class="w-full md:w-7/12 p-8 md:p-12 overflow-y-auto custom-scrollbar relative">
                <div class="detail-item" style="transition-delay: 100ms;">
                    <h2 id="modal-title-long" class="text-4xl md:text-5xl font-black uppercase italic mb-6 leading-none"></h2>
                    <p id="modal-desc" class="text-lg text-gray-300 font-light leading-relaxed mb-10 border-l-2 border-[#849279] pl-6"></p>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 mb-10 detail-item" style="transition-delay: 200ms;">
                    <div>
                        <h4 class="text-white font-bold uppercase tracking-widest text-xs mb-4 flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-[#849279]"></span> Eigenschappen
                        </h4>
                        <ul id="modal-specs" class="space-y-3 text-sm text-gray-400 font-medium">
                            <!-- JS fills this -->
                        </ul>
                    </div>
                    <div>
                        <h4 class="text-white font-bold uppercase tracking-widest text-xs mb-4 flex items-center gap-2">
                            <span class="w-2 h-2 rounded-full bg-[#849279]"></span> Voordelen
                        </h4>
                        <ul id="modal-pros" class="space-y-3 text-sm text-gray-400 font-medium">
                             <!-- JS fills this -->
                        </ul>
                    </div>
                </div>

                <div class="bg-white/5 p-6 rounded-xl border border-white/10 detail-item" style="transition-delay: 300ms;">
                    <h4 class="text-[#849279] font-bold uppercase tracking-widest text-xs mb-2">Technische Opbouw</h4>
                    <p id="modal-tech" class="text-gray-400 text-sm leading-relaxed"></p>
                </div>
                
                <div class="mt-8 pt-8 border-t border-white/10 flex justify-between items-center detail-item" style="transition-delay: 400ms;">
                     <a href="#contact" onclick="closeDetail()" class="text-white font-bold uppercase tracking-widest text-xs hover:text-[#849279] transition-colors flex items-center gap-2">
                        Nu Offerte Aanvragen
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
                        </svg>
                     </a>
                </div>
            </div>
        </div>
    </div>
<!-- Projects Grid -->
    <section id="projects" class="py-32 px-6">
        <div class="max-w-7xl mx-auto mb-20 flex flex-col md:flex-row md:items-end justify-between gap-8 reveal-on-scroll">
            <div>
                <h2 class="hero-title font-black uppercase italic tracking-tighter">Onze<br><span class="text-stroke">Projecten.</span></h2>
            </div>
            <p class="max-w-xs text-gray-500 text-sm uppercase tracking-widest leading-relaxed border-l border-[#849279] pl-6">
                Van high-end penthouses in Amsterdam tot minimalistische villa's in de natuur.
            </p>
        </div>

        <div class="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-12 gap-6">
            <!-- Project 1 -->
            <div class="md:col-span-8 group relative overflow-hidden rounded-2xl aspect-[16/9] cursor-pointer reveal-on-scroll">
                <!-- Custom User Image -->
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf9fe3756a84502acbc24_pexels-nastyasensei-66707-2336783.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1590381105924-c72589b9ef3f?auto=format&fit=crop&q=80&w=1200';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="Woonkamer met gietvloer">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Amsterdam</span>
                    <h4 class="text-4xl font-black uppercase italic tracking-tighter">Prachtige serre</h4>
                </div>
            </div>
            <!-- Project 2 -->
            <div class="md:col-span-4 group relative overflow-hidden rounded-2xl aspect-[4/5] cursor-pointer reveal-on-scroll" style="transition-delay: 100ms;">
                <!-- Custom User Image -->
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf7dbc95bd3adcaa9f489_pexels-goodcitizen-1315919.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&q=80&w=800';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="Villa met tuinverbinding">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Utrecht</span>
                    <h4 class="text-3xl font-black uppercase italic tracking-tighter">Unieke garage</h4>
                </div>
            </div>
        </div>
        
        <div class="max-w-7xl mx-auto mt-6 grid grid-cols-1 md:grid-cols-12 gap-6">
            <!-- Project 3 -->
            <div class="md:col-span-4 group relative overflow-hidden rounded-2xl aspect-[4/5] cursor-pointer reveal-on-scroll">
                <!-- Custom User Image -->
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf7b2e193d5c34d670227_pexels-8pcarlos-morocho-2150734957-35509788.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&q=80&w=800';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="High-end garage studio">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Rotterdam</span>
                    <h4 class="text-3xl font-black uppercase italic tracking-tighter">Luxe badkamer</h4>
                </div>
            </div>
            <!-- Project 4 -->
            <div class="md:col-span-8 group relative overflow-hidden rounded-2xl aspect-[16/9] cursor-pointer reveal-on-scroll" style="transition-delay: 100ms;">
                <!-- Custom User Image -->
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf7579774d35d74b1a2dc_pexels-pixabay-271743.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1517581177682-a085bb7ffb15?auto=format&fit=crop&q=80&w=1200';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="Moderne keuken gietvloer">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Deventer</span>
                    <h4 class="text-4xl font-black uppercase italic tracking-tighter">Moderne kamer</h4>
                </div>
            </div>
        </div>

        <!-- NEW Row: Project 5 & 6 -->
        <div class="max-w-7xl mx-auto mt-6 grid grid-cols-1 md:grid-cols-12 gap-6">
            <!-- Project 5 -->
            <div class="md:col-span-6 group relative overflow-hidden rounded-2xl aspect-[4/3] cursor-pointer reveal-on-scroll">
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf80da9988b014a5ee98c_pexels-alex-paz-619370337-17358075.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1556912173-3db996ea8c3e?auto=format&fit=crop&q=80&w=1200';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="Industriële loft vloer">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Eindhoven</span>
                    <h4 class="text-3xl font-black uppercase italic tracking-tighter">Industriële Loft</h4>
                </div>
            </div>
            <!-- Project 6 -->
            <div class="md:col-span-6 group relative overflow-hidden rounded-2xl aspect-[4/3] cursor-pointer reveal-on-scroll" style="transition-delay: 100ms;">
                <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bf87a690b268a60435d06_pexels-atbo-66986-245240.jpg"
                     onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=1200';" 
                     class="w-full h-full object-cover grayscale group-hover:grayscale-0 group-hover:scale-105 transition-all duration-1000 ease-out" 
                     alt="Minimalistisch kantoor">
                <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent opacity-80 group-hover:opacity-60 transition-opacity"></div>
                <div class="absolute bottom-10 left-10 translate-y-4 group-hover:translate-y-0 transition-transform duration-500">
                    <span class="text-[#849279] text-xs font-bold uppercase tracking-[0.3em] mb-4 block">Maastricht</span>
                    <h4 class="text-3xl font-black uppercase italic tracking-tighter">Minimalistisch Kantoor</h4>
                </div>
            </div>
        </div>
    </section>
    
    <!-- FAQ Section -->
    <section id="faq" class="py-32 px-6 bg-black/40">
        <div class="max-w-4xl mx-auto">
            <div class="text-center mb-16 reveal-on-scroll">
                <h2 class="text-[#849279] text-xs font-bold tracking-[0.4em] uppercase mb-4">Informatie</h2>
                <h3 class="text-4xl md:text-5xl font-black uppercase italic">Veelgestelde Vragen.</h3>
            </div>

            <div class="space-y-4">
                <!-- FAQ Item 1 -->
                <div class="faq-item glass rounded-2xl reveal-on-scroll hover:border-[#849279]/30 transition-colors">
                    <button class="w-full px-8 py-6 flex items-center justify-between text-left group">
                        <span class="text-lg font-bold uppercase tracking-tight pr-6">1. Hoe lang duurt het proces van ontwerp tot realisatie?</span>
                        <div class="w-8 h-8 rounded-full border border-white/20 flex items-center justify-center shrink-0 transition-all duration-300 group-hover:border-[#849279] group-hover:text-[#849279] faq-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-transform duration-300">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </div>
                    </button>
                    <div class="faq-content">
                        <div class="px-8 pb-8 text-gray-400 font-light leading-relaxed">
                            <p class="mb-4">Het is belangrijk om onderscheid te maken tussen de "werkplaatstijd" en de "montagetijd".</p>
                            <ul class="list-disc pl-5 space-y-2">
                                <li><strong class="text-white">Ontwerpfase:</strong> Meestal duurt het 1 tot 2 weken om het ontwerp en de materiaalkeuze definitief te maken.</li>
                                <li><strong class="text-white">Productie:</strong> In de werkplaats hebben we 3 tot 5 weken nodig voor de ambachtelijke vervaardiging en het laten drogen van lak of olie.</li>
                                <li><strong class="text-white">Montage:</strong> De eigenlijke plaatsing bij u thuis duurt doorgaans slechts 1 tot 3 dagen, afhankelijk van de grootte van het project.</li>
                                <li><strong class="text-white">Nawerking:</strong> Hout is een natuurlijk product; in de eerste 2 weken na plaatsing moet het materiaal acclimatiseren aan de luchtvochtigheid in uw woning.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="faq-item glass rounded-2xl reveal-on-scroll hover:border-[#849279]/30 transition-colors" style="transition-delay: 50ms;">
                    <button class="w-full px-8 py-6 flex items-center justify-between text-left group">
                        <span class="text-lg font-bold uppercase tracking-tight pr-6">2. Gaat het hout van mijn meubel of kast werken?</span>
                        <div class="w-8 h-8 rounded-full border border-white/20 flex items-center justify-center shrink-0 transition-all duration-300 group-hover:border-[#849279] group-hover:text-[#849279] faq-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-transform duration-300">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </div>
                    </button>
                    <div class="faq-content">
                        <div class="px-8 pb-8 text-gray-400 font-light leading-relaxed">
                            <p class="mb-4">Ja, hout is een hygroscopisch materiaal, wat betekent dat het reageert op de luchtvochtigheid. Wij beheersen dit proces echter:</p>
                            <ul class="list-disc pl-5 space-y-2">
                                <li><strong class="text-white">Materiaalkeuze:</strong> Wij gebruiken enkel hout dat in de oven is gedroogd tot een vochtigheidspercentage van 8-10%, ideaal voor binnenshuis.</li>
                                <li><strong class="text-white">Constructie:</strong> Wij passen "zwevende" verbindingen en ruimte voor expansie toe in panelen, zodat het hout kan uitzetten en krimpen zonder te barsten.</li>
                                <li><strong class="text-white">Afwerking:</strong> Door alle zijden (ook de onzichtbare achterkant) te verzegelen met lak of olie, vertragen we de opname van vocht en minimaliseren we vervorming.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="faq-item glass rounded-2xl reveal-on-scroll hover:border-[#849279]/30 transition-colors" style="transition-delay: 100ms;">
                    <button class="w-full px-8 py-6 flex items-center justify-between text-left group">
                        <span class="text-lg font-bold uppercase tracking-tight pr-6">3. Kan ik zelf de indeling en kleur bepalen?</span>
                        <div class="w-8 h-8 rounded-full border border-white/20 flex items-center justify-center shrink-0 transition-all duration-300 group-hover:border-[#849279] group-hover:text-[#849279] faq-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-transform duration-300">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </div>
                    </button>
                    <div class="faq-content">
                        <div class="px-8 pb-8 text-gray-400 font-light leading-relaxed">
                            <ul class="list-disc pl-5 space-y-2">
                                <li><strong class="text-white">Indeling:</strong> Alles wordt op maat ingedeeld voor uw specifieke spullen, van stofzuigers tot ladekasten voor horloges.</li>
                                <li><strong class="text-white">Kleur & Textuur:</strong> Keuze uit honderden RAL-kleuren, verschillende glansgraden of natuurlijke oliën die de houtnerf accentueren.</li>
                                <li><strong class="text-white">Monsters:</strong> Wij leveren fysieke kleurstalen zodat u kunt zien hoe de afwerking reageert op het licht in uw eigen woning.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 4 -->
                <div class="faq-item glass rounded-2xl reveal-on-scroll hover:border-[#849279]/30 transition-colors" style="transition-delay: 150ms;">
                    <button class="w-full px-8 py-6 flex items-center justify-between text-left group">
                        <span class="text-lg font-bold uppercase tracking-tight pr-6">4. Verschil: Gelakt vs. Geolied hout?</span>
                        <div class="w-8 h-8 rounded-full border border-white/20 flex items-center justify-center shrink-0 transition-all duration-300 group-hover:border-[#849279] group-hover:text-[#849279] faq-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-transform duration-300">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </div>
                    </button>
                    <div class="faq-content">
                        <div class="px-8 pb-8 text-gray-400 font-light leading-relaxed">
                            <ul class="list-disc pl-5 space-y-2">
                                <li><strong class="text-white">Gelakt (Onderhoudsarm):</strong> Er wordt een onzichtbare, harde beschermlaag over het hout gespoten. Volledig vloeistofdicht, krasbestendig en hoeft jarenlang niet behandeld te worden. De glansgraad (mat tot hoogglans) blijft constant.</li>
                                <li><strong class="text-white">Geolied (Natuurlijk):</strong> De olie trekt diep in de vezels van het hout. Dit accentueert de structuur en zorgt voor een warme, matte uitstraling. Kleine krasjes kunnen lokaal worden bijgewerkt, maar het hout heeft periodiek een nieuwe voedingslaag nodig.</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- FAQ Item 5 -->
                <div class="faq-item glass rounded-2xl reveal-on-scroll hover:border-[#849279]/30 transition-colors" style="transition-delay: 200ms;">
                    <button class="w-full px-8 py-6 flex items-center justify-between text-left group">
                        <span class="text-lg font-bold uppercase tracking-tight pr-6">5. Kunnen kasten worden geplaatst tegen scheve muren?</span>
                        <div class="w-8 h-8 rounded-full border border-white/20 flex items-center justify-center shrink-0 transition-all duration-300 group-hover:border-[#849279] group-hover:text-[#849279] faq-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-transform duration-300">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                            </svg>
                        </div>
                    </button>
                    <div class="faq-content">
                        <div class="px-8 pb-8 text-gray-400 font-light leading-relaxed">
                            <p class="mb-2"><strong class="text-white">Wij maken gebruik van 'passtukken' die we ter plekke exact op de contouren van uw muren, vloer en plafond schaven. Hierdoor verdwijnen kieren volledig.</strong></p>
                            <p class="mb-4">Hoewel uw woning misschien niet recht is, wordt het binnenwerk van de kast altijd 100% waterpas gesteld, wat essentieel is voor het soepel openen van deuren en laden.</p>
                            <p class="text-xs text-[#849279] uppercase font-bold tracking-widest">Let op: Bij nieuwbouw adviseren wij om de kasten pas te plaatsen nadat de woning volledig is gestukt en de eerste werking van de muren heeft plaatsgevonden.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    
<!-- Moodboard Section (NEW) -->
    <section id="moodboard" class="py-20 px-6 bg-[#0f0f0f] border-t border-[#849279]/10 relative z-10">
        <div class="max-w-7xl mx-auto">
            <div class="text-center mb-12 reveal-on-scroll">
                <h2 class="text-[#849279] text-xs font-bold tracking-[0.4em] uppercase mb-4">Ons harde werk</h2>
                <h3 class="text-3xl md:text-4xl font-black uppercase italic">Verzameling van onze projecten</h3>
            </div>
            
            <!-- Scrollable Container -->
            <div class="h-[500px] overflow-y-auto pr-2 custom-scrollbar glass rounded-3xl p-6 reveal-on-scroll">
                <div class="columns-2 md:columns-4 lg:columns-6 gap-4 space-y-4">
                    <!-- Gallery Images -->
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeba66817504f4a96e97_pexels-shvetsa-5710791.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 1">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfebaec82b363aae2c086_pexels-shvetsa-5711877.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 2">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeba22f1e34ca93b3234_pexels-ivan-s-4491841.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 3">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfebad299a0cf4ab65b43_pexels-ono-kosuki-5974296.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 4">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfebac1f4fa7f641b2f8e_pexels-tima-miroshnichenko-5059640.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 5">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeb91cca4a4a4e4617bf_pexels-ono-kosuki-5974354.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 4">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeb9054fd73a285e86c5_pexels-tima-miroshnichenko-6790942.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 5">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeb97efd6d0463eeb7f3_pexels-ono-kosuki-5973972.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 4">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeb97b8d957e339bd7e0_pexels-ron-lach-8821546.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 5">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bfeb8650d704524571bb1_pexels-ono-kosuki-5973898.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 6">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff95980ba6282d4cb5cb_pexels-shvetsa-5711879.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 7">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff95ee1562c72e4bf6f6_pexels-mikael-blomkvist-8961526.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 8">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff952b22268244649dbb_pexels-thijsvdw-1094770.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 9">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff94f1a9c548eadb4a5e_pexels-yaroslav-shuraev-4889066.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 6">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff932f960796280cb277_pexels-reneterp-3990359.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 7">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695bff92cfc8182b50f60e62_pexels-bidvine-517980-1249610.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 8">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00adf99fc8fe54701602_pexels-kseniachernaya-5767926.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 9">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00afe62d989d553487a0_pexels-ivan-s-5798980.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 6">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00b1cf3d8f151e8d6690_pexels-shvetsa-5710738.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 7">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00acfb7634e112f5fad7_pexels-ono-kosuki-5974325.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 8">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00ad337dd68707c891d3_pexels-ono-kosuki-5973974.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 9">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00abfda40db1d65e2e78_pexels-ono-kosuki-5973971.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 10">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00aa9a7d0a0a7ceb1626_pexels-ono-kosuki-5974049.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 11">
                    <img src="https://cdn.prod.website-files.com/695b99f29b182aca896dfb8f/695c00ab92964b6b4baaa4ad_pexels-ono-kosuki-5973894.jpg" class="w-full rounded-lg hover:opacity-80 transition-opacity duration-300 break-inside-avoid" alt="Detail 12">
                </div>
            </div>
        </div>
    </section>

    <!-- Footer / Contact -->
    <footer id="contact" class="bg-white text-black pt-32 pb-12 px-6 rounded-t-[3rem] md:rounded-t-[5rem] relative overflow-hidden mt-20">
        <div class="max-w-7xl mx-auto grid lg:grid-cols-2 gap-24">
            <div class="reveal-on-scroll">
                <h2 class="text-6xl md:text-8xl font-black uppercase tracking-tighter leading-[0.85] mb-12">
                    Laten we iets<br><span class="text-gray-300">nieuws bouwen.</span>
                </h2>
                
                <div class="grid sm:grid-cols-2 gap-12">
                    <div class="space-y-4">
                        <p class="text-[10px] uppercase tracking-widest font-black text-gray-400">Direct Contact</p>
                        <a href="mailto:mail@florovloerenspecialist.nl" class="block text-2xl font-bold hover:text-[#849279] transition-colors">mail@houten.nl</a>
                        <p class="text-2xl font-bold">06 29586645</p>
                    </div>
                    <div class="space-y-4">
                        <p class="text-[10px] uppercase tracking-widest font-black text-gray-400">Laten we koffie drinken! (Afspraak)</p>
                        <p class="text-lg leading-snug font-medium text-gray-600">
                              Darterstraat 44<br>2636 KB, Rotterdam
                        </p>
                    </div>
                </div>

                <div class="mt-20 flex gap-8">
                    <a href="#" class="text-xs font-black uppercase tracking-widest hover:text-[#849279] transition-all underline underline-offset-8 decoration-2">Instagram</a>
                    <a href="#" class="text-xs font-black uppercase tracking-widest hover:text-[#849279] transition-all underline underline-offset-8 decoration-2">Facebook</a>
                    <a href="#" class="text-xs font-black uppercase tracking-widest hover:text-[#849279] transition-all underline underline-offset-8 decoration-2">LinkedIn</a>
                </div>
            </div>

        <div class="bg-gray-50 p-10 md:p-14 rounded-[3rem] reveal-on-scroll" style="transition-delay: 100ms;">
    <h3 class="text-2xl font-black uppercase italic tracking-tight mb-8">Vraag een offerte aan</h3>
    <form id="contactForm" action="https://formspree.io/f/mlgrqzdv" method="POST" class="space-y-6">
        <div class="grid md:grid-cols-2 gap-6">
            <div class="space-y-2">
                <label class="text-[10px] uppercase font-bold tracking-widest text-gray-500">Naam</label>
                <input type="text" name="naam" required class="w-full bg-transparent border-b border-gray-300 py-3 focus:outline-none focus:border-[#849279] focus:border-b-2 transition-all text-sm font-medium" placeholder="Uw naam">
            </div>
            <div class="space-y-2">
                <label class="text-[10px] uppercase font-bold tracking-widest text-gray-500">E-mail</label>
                <input type="email" name="email" required class="w-full bg-transparent border-b border-gray-300 py-3 focus:outline-none focus:border-[#849279] focus:border-b-2 transition-all text-sm font-medium" placeholder="E-mailadres">
            </div>
        </div>
        <div class="space-y-2">
            <label class="text-[10px] uppercase font-bold tracking-widest text-gray-500">Kies de gewenste dienst</label>
            <div class="relative">
                <select name="dienst" class="w-full bg-transparent border-b border-gray-300 py-3 focus:outline-none focus:border-[#849279] focus:border-b-2 transition-all text-sm font-medium appearance-none cursor-pointer">
                    <option value="Maatwerkkasten">Maatwerkkasten</option>
                    <option value="Plinten & Afwerking">Plinten & Afwerking</option>
                    <option value="Binnendeuren">Binnendeuren</option>
                    <option value="Trapafwerking">Trapafwerking</option>
                </select>
                <div class="absolute right-0 top-1/2 -translate-y-1/2 pointer-events-none text-gray-400">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 8.25l-7.5 7.5-7.5-7.5" />
                    </svg>
                </div>
            </div>
        </div>
        <div class="space-y-2">
            <label class="text-[10px] uppercase font-bold tracking-widest text-gray-500">Bericht / Oppervlakte (m2)</label>
            <textarea name="bericht" rows="3" required class="w-full bg-transparent border-b border-gray-300 py-3 focus:outline-none focus:border-[#849279] focus:border-b-2 transition-all text-sm font-medium resize-none" placeholder="Vertel ons meer over uw project..."></textarea>
        </div>
        <button type="submit" class="w-full bg-black text-white font-black uppercase tracking-widest py-5 text-xs hover:bg-[#849279] transition-all duration-500 rounded-full mt-4 shadow-xl hover:shadow-2xl">
            Verstuur Aanvraag
        </button>
    </form>
</div>
        </div>

        <div class="max-w-7xl mx-auto mt-32 pt-10 border-t border-gray-200 flex flex-col md:flex-row justify-between items-center gap-6">
            <p class="text-[10px] font-bold text-gray-400 uppercase tracking-[0.2em]">© 2025 Houten.NL — MEESTERS IN HOUT</p>
            <div class="flex gap-8 text-[10px] font-bold text-gray-400 uppercase tracking-widest">
                <a href="#" class="hover:text-black transition-colors">Algemene Voorwaarden</a>
                <a href="#" class="hover:text-black transition-colors">Privacy Policy</a>
            </div>
        </div>
    </footer>

    <script>
        const menuToggle = document.getElementById('menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');
        const menuIcon = document.getElementById('menu-icon');
        const navbar = document.getElementById('navbar');
        let isOpen = false;

        function toggleMenu() {
            isOpen = !isOpen;
            if (isOpen) {
                mobileMenu.classList.remove('translate-x-full');
                menuIcon.innerHTML = `<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />`;
                document.body.style.overflow = 'hidden';
            } else {
                mobileMenu.classList.add('translate-x-full');
                menuIcon.innerHTML = `<path stroke-linecap="round" stroke-linejoin="round" d="M3.75 9h16.5m-16.5 6.75h16.5" />`;
                document.body.style.overflow = 'auto';
            }
        }

        menuToggle.addEventListener('click', toggleMenu);

        // Hide Navbar on Scroll Down, Show on Up
        let lastScroll = 0;
        window.addEventListener('scroll', () => {
            const currentScroll = window.pageYOffset;
            if (currentScroll <= 0) {
                navbar.classList.remove('-translate-y-full');
                return;
            }
            if (currentScroll > lastScroll && !isOpen) {
                navbar.classList.add('-translate-y-full');
            } else {
                navbar.classList.remove('-translate-y-full');
            }
            lastScroll = currentScroll;
        });

        // Intersection Observer for Scroll Animations
        const observerOptions = {
            threshold: 0.1,
            rootMargin: "0px 0px -50px 0px"
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        document.querySelectorAll('.reveal-on-scroll').forEach(el => observer.observe(el));

        // FAQ Accordion Logic
        document.querySelectorAll('.faq-item button').forEach(button => {
            button.addEventListener('click', () => {
                const content = button.nextElementSibling;
                const icon = button.querySelector('.faq-icon svg');
                
                // Toggle current
                if (content.style.maxHeight) {
                    content.style.maxHeight = null;
                    icon.style.transform = 'rotate(0deg)';
                    button.querySelector('.faq-icon').classList.remove('border-[#849279]', 'text-[#849279]');
                } else {
                    content.style.maxHeight = content.scrollHeight + "px";
                    icon.style.transform = 'rotate(45deg)';
                    button.querySelector('.faq-icon').classList.add('border-[#849279]', 'text-[#849279]');
                }
            });
        });

        // Form Submit Simulation
        document.getElementById('contactForm').addEventListener('submit', async function(e) {
    e.preventDefault();
    const form = e.target;
    const btn = form.querySelector('button');
    const originalText = btn.innerText;
    
    // UI Feedback
    btn.innerText = "Verzenden...";
    btn.disabled = true;

    // Send data to Formspree
    const data = new FormData(form);
    
    try {
        const response = await fetch(form.action, {
            method: 'POST',
            body: data,
            headers: {
                'Accept': 'application/json'
            }
        });

        if (response.ok) {
            // Success: Trigger Confetti
            launchConfetti();
            btn.innerText = "Bedankt! We nemen contact op.";
            btn.classList.add('bg-[#849279]');
            form.reset();
        } else {
            btn.innerText = "Fout bij verzenden...";
            btn.classList.add('bg-red-500');
        }
    } catch (error) {
        btn.innerText = "Netwerkfout...";
        btn.classList.add('bg-red-500');
    }

    // Reset button state after 4 seconds
    setTimeout(() => {
        btn.innerText = originalText;
        btn.disabled = false;
        btn.classList.remove('bg-[#849279]', 'bg-red-500');
    }, 4000);
});

        // "Offerte" Button Confetti
        document.getElementById('nav-offerte-btn').addEventListener('click', () => {
            launchConfetti();
        });

        // WOW Confetti Explosion Function
        function launchConfetti() {
            var count = 200;
            var defaults = {
                origin: { y: 0.7 }
            };

            function fire(particleRatio, opts) {
                confetti(Object.assign({}, defaults, opts, {
                    particleCount: Math.floor(count * particleRatio)
                }));
            }

            fire(0.25, {
                spread: 26,
                startVelocity: 55,
            });
            fire(0.2, {
                spread: 60,
            });
            fire(0.35, {
                spread: 100,
                decay: 0.91,
                scalar: 0.8
            });
            fire(0.1, {
                spread: 120,
                startVelocity: 25,
                decay: 0.92,
                scalar: 1.2
            });
            fire(0.1, {
                spread: 120,
                startVelocity: 45,
            });
        }

        /* --- New: Detailed Modal Logic --- */
        const detailsData = {
            woonbeton: {
                titleShort: "Maatwerk Interieur",
                titleLong: "Tijdloze <br><span class='text-stroke'>Perfectie.</span>",
                desc: "Maatwerk interieur is geen standaard meubilair; het is een verlengstuk van uw architectuur. Gemaakt van de fijnste houtsoorten en hoogwaardige materialen, kenmerkt dit werk zich door zijn unieke vlamtekening en ambachtelijke verbindingen.",
                specs: [
                    "Hoogwaardig Materiaalgebruik",
                    "Totale Ontwerpvrijheid",
                    "Ambachtelijke Details",
                    "Persoonlijke Afwerking"
                ],
                pros: [
                    "Maximale Ruimtebenutting",
                    "Uniek Karakter",
                    "Waardevaste Investering",
                    "Zorgeloos Proces"
                ],
                tech: "Opbouw: 1. Projectanalyse | 2. Ontwerp & Voorbereiding | 3. Ambachtelijke Constructie | 4. Precisie Montage | 5. Controle | 6. Finishing Touch ",
                img: "https://cdn.prod.website-files.com/695ad27aaf5bf431d323bfb2/695ae0a007d94473180ff97b_Redstone-Interiors-Inc_Werschay-Homes_Country-Cottage-7-1-scaled-1.jpg"
            },
            pu: {
                titleShort: "Ambachtelijk houtwerk",
                titleLong: "Zacht <br><span class='text-stroke'>Comfort.</span>",
                desc: "Ambachtelijk houtwerk brengt de ziel terug in uw woning. In tegenstelling tot fabrieksmatige meubels, ademt handgemaakt maatwerk warmte en authenticiteit uit. Elk project begint met een passie voor de natuurlijke vlamtekening van het hout en eindigt met een resultaat dat tot op de millimeter nauwkeurig in uw architectuur is geïntegreerd.",
                specs: [
                    "Constructieve Integriteit",
                    "Selectieve Houtkeuze",
                    "Natuurlijke Bescherming",
                    "Onzichtbare Perfectie"
                ],
                pros: [
                        "100% Maatwerk",
                    "Authentiek Karakter",
                    "Duurzaamheid",
                    "Optimale Benutting"
                ],
                tech: "Opbouw: 1. Opname & Advies | 2. Houtselectie | 3. Constructie | 4. Montage & Stellen | 5. Afwerking ter Plaatse ",
                img: "https://cdn.prod.website-files.com/695ad27aaf5bf431d323bfb2/695ae13e2378acf2b57be903_pexels-amar-18868627.jpg"
            },
            industrieel: {
                titleShort: "Renovatie| Restauratie",
                titleLong: "Historische <br><span class='text-stroke'>Perfectie.</span>",
                desc: "Wanneer het behoud van karakter essentieel is. Onze renovatie- en restauratiediensten zijn gericht op het herstellen van de oorspronkelijke glorie van uw houtwerk, zonder de sporen van de tijd uit te wissen.",
                specs: [
                    "Historische Getrouwheid",
                    "Constructief Herstel",
                    "Behoud van Patina",
                    "Maatwerk Integratie"
                ],
                pros: [
                    "Behoud van Erfgoed",
                    "Duurzame Upgrade",
                    "Waardevermeerdering",
                    "Uniek Vakmanschap"
                ],
                tech: "Opbouw: 1. Conditie-analyse | 2. Behandelplan | 3. Ambachtelijke Ingreep | 4. Oppervlaktebehandeling | 5. Fijnafstelling ",
                img: "https://cdn.prod.website-files.com/695ad27aaf5bf431d323bfb2/695ae1a36e49e2173a4269b3_pexels-aboodi-18435523.jpg"
            }
        };

        const modal = document.getElementById('detail-modal');
        const modalImg = document.getElementById('modal-image');

        function openDetail(type) {
            const data = detailsData[type];
            if(!data) return;

            // Fill Content
            document.getElementById('modal-title-short').innerText = data.titleShort;
            document.getElementById('modal-title-long').innerHTML = data.titleLong;
            document.getElementById('modal-desc').innerText = data.desc;
            document.getElementById('modal-tech').innerText = data.tech;
            
            // Fill lists
            const specsList = document.getElementById('modal-specs');
            specsList.innerHTML = data.specs.map(item => `<li>• ${item}</li>`).join('');
            
            const prosList = document.getElementById('modal-pros');
            prosList.innerHTML = data.pros.map(item => `<li>• ${item}</li>`).join('');

            // Set Image
            modalImg.src = data.img;

            // Show Modal
            modal.classList.remove('hidden'); // Remove tailwind hidden if strictly used, currently using flex/opacity
            
            // Animation trigger
            // Small timeout to allow display:flex to apply before opacity transition
            setTimeout(() => {
                modal.classList.add('active');
                document.body.style.overflow = 'hidden'; // Prevent bg scroll
            }, 10);
        }

        function closeDetail() {
            modal.classList.remove('active');
            setTimeout(() => {
                // modal.classList.add('hidden'); // If you were toggling display
                document.body.style.overflow = 'auto';
            }, 400); // Match CSS transition time
        }

        // Close on clicking outside content
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                closeDetail();
            }
        });
    </script>
</body>
</html>
