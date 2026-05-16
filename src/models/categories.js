import db from './db.js'

    const getAllCategory = async() => {
        const query =   ` 
            SELECT name
            FROM public.category;
        `;

    const result = await db.query(query);

    return result.rows;
}

export {getAllCategory}