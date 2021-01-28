-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE rooms (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL
);
CREATE TABLE messages (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    room_id UUID NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    user_name TEXT NOT NULL
);
CREATE TABLE events (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL
);
ALTER TABLE messages
ADD CONSTRAINT messages_ref_room_id FOREIGN KEY (room_id) REFERENCES rooms (id) ON DELETE NO ACTION;
