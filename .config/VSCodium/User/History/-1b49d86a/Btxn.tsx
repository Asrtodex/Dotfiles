import Image from "next/image";
import Link from "next/link";
import Author from "./child/author";

export default function LatestPost(){
    return(
        <section className="container mx-auto md:px-20 py-10">
            <h1 className="font-bold text-4xl py-12 text-center">Latest Posts</h1>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-14">
                <Posts/>
                <Posts/>
                <Posts/>
                <Posts/>
                <Posts/>
                <Posts/>
            </div>
        </section>
    );
}

function Posts(){
    return(
        <div className="item">
            <div className="images">
                <Link href={"/"}>
                   <Image src={"/assets/images/gotham.png"} width={500} height={350} alt="test" />
                </Link>
            </div>
            <div className="info flex justify-center flex-col py-4">
                <div className="cat">
                    <Link href={"/"}><span className="text-orange-400 hover:text-orange-600">React</span></Link>
                    <Link href={"/"}><span className="text-gray-400 hover:text-gray-600"> - Publish Date: 27 Juli 2022</span></Link>
                </div>
                <div className="title">
                    <Link href={"/"}>
                        <h1 className="text-xl font-bold text-grey-800 hover:text-grey-600">Post title</h1>
                    </Link>
                </div>
                <p className="text-grey-500 py-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer euismod, risus ut rutrum consequat, arcu massa interdum justo, ut ullamcorper ligula mi sed augue. Curabitur congue molestie dui at tincidunt. Nulla turpis odio, luctus quis facilisis ac, semper ut velit. Donec suscipit eu mi eu tristique. Donec in feugiat urna, eget mattis quam. Donec eget erat vitae ante porttitor imperdiet. Curabitur tempor eu sem ut laoreet. Fusce cursus mauris sodales ligula eleifend, eget semper massa blandit. Nullam aliquet orci vel mi volutpat consectetur.</p>
                <Author></Author>
            </div>
        </div>
    );
}
