import {Entity, PrimaryGeneratedColumn, Column} from "typeorm";

@Entity()
export class Seo {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    title: string;

    @Column()
    keywords: string;

    @Column()
    description: string;

}


// how to use
/*
import {Seo} from "./Seo";
@OneToOne(() => Seo)
@JoinColumn()
seo: Seo;
*/