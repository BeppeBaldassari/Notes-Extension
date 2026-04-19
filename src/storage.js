// Simple storage without encryption for testing

const Storage = {
  // Get all notes from storage
  async getAllNotes() {
    try {
      const result = await browser.storage.local.get('notes');
      console.log('Storage: Got notes', result.notes);
      return result.notes || [];
    } catch (e) {
      console.error('Storage Error - getAllNotes:', e);
      return [];
    }
  },

  // Get a single note by ID
  async getNote(noteId) {
    try {
      const notes = await this.getAllNotes();
      return notes.find(note => note.id === noteId);
    } catch (e) {
      console.error('Storage Error - getNote:', e);
      return null;
    }
  },

  // Save a new note or update existing
  async saveNote(note) {
    try {
      const notes = await this.getAllNotes();
      
      if (note.id) {
        // Update existing note
        const index = notes.findIndex(n => n.id === note.id);
        if (index !== -1) {
          notes[index] = {
            ...notes[index],
            ...note,
            updatedAt: new Date().toISOString()
          };
        }
      } else {
        // Create new note
        const newNote = {
          id: Date.now().toString(),
          title: note.title || 'Untitled Note',
          content: note.content || '',
          createdAt: new Date().toISOString(),
          updatedAt: new Date().toISOString()
        };
        notes.push(newNote);
      }
      
      await browser.storage.local.set({ notes: notes });
      console.log('Storage: Saved notes', notes);
      return note;
    } catch (e) {
      console.error('Storage Error - saveNote:', e);
    }
  },

  // Delete a note by ID
  async deleteNote(noteId) {
    try {
      let notes = await this.getAllNotes();
      notes = notes.filter(note => note.id !== noteId);
      await browser.storage.local.set({ notes: notes });
      console.log('Storage: Deleted note, remaining:', notes);
    } catch (e) {
      console.error('Storage Error - deleteNote:', e);
    }
  }
};
