import Image from "next/image";
import Link from "next/link";
import Author from "./child/author";
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import SwiperCore, { Autoplay } from "swiper";

export default function Slider(){
    SwiperCore.use([Autoplay]);
    return(
        <section className="py-16">
            <div className="container mx-auto md:px-20">
                <h1 className="font-bold text-4xl pb-12 text-center">Trending</h1>
                <Swiper slidesPerView={1} autoplay={{ delay:2000, disableOnInteraction:false}} loop={true}>
                    <SwiperSlide><Slide /></SwiperSlide>
                    <SwiperSlide><Slide /></SwiperSlide>
                    <SwiperSlide><Slide /></SwiperSlide>
                    <SwiperSlide><Slide /></SwiperSlide>
               </Swiper>
            </div>
        </section>
    );
}

function Slide(){
    return (
        <div className="grid md:grid-cols-2 gap-4">
            <div className="image">
                <Link href={"/"}>
                   <Image src={"/assets/images/gotham.png"} width={600} height={400} alt="test" />
                </Link>
            </div>
            <div className="info flex justify-center flex-col">
                <div className="cat">
                    <Link href={"/"}><span className="text-orange-400 hover:text-orange-600">React</span></Link>
                    <Link href={"/"}><span className="text-gray-400 hover:text-gray-600"> - Publish Date: 27 Juli 2022</span></Link>
                </div>

                <div className="title">
                    <Link href={"/"}>
                        <h1 className="text-3xl md:text-5xl font-bold text-grey-800 hover:text-grey-600">Post title</h1>
                    </Link>
                </div>
                
                <p className="text-grey-500 py-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer euismod, risus ut rutrum consequat, arcu massa interdum justo, ut ullamcorper ligula mi sed augue. Curabitur congue molestie dui at tincidunt. Nulla turpis odio, luctus quis facilisis ac, semper ut velit. Donec suscipit eu mi eu tristique. Donec in feugiat urna, eget mattis quam. Donec eget erat vitae ante porttitor imperdiet. Curabitur tempor eu sem ut laoreet. Fusce cursus mauris sodales ligula eleifend, eget semper massa blandit. Nullam aliquet orci vel mi volutpat consectetur.</p>
                <Author></Author>
            </div>
        </div>
    );
}
