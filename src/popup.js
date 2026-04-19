// Popup script for the Notes extension

let currentNoteId = null;

// DOM Elements
const newNoteBtn = document.getElementById('newNoteBtn');
const notesList = document.getElementById('notesList');
const noteEditor = document.getElementById('noteEditor');
const noteTitle = document.getElementById('noteTitle');
const noteContent = document.getElementById('noteContent');
const saveNoteBtn = document.getElementById('saveNoteBtn');
const backBtn = document.getElementById('backBtn');

// Initialize
document.addEventListener('DOMContentLoaded', async () => {
  await displayNotesList();
});

// Event Listeners
newNoteBtn.addEventListener('click', () => {
  showEditor(null);
});

saveNoteBtn.addEventListener('click', async () => {
  await saveCurrentNote();
});

backBtn.addEventListener('click', async () => {
  hideEditor();
  await displayNotesList();
});

// Display the list of notes
async function displayNotesList() {
  const notes = await Storage.getAllNotes();
  
  notesList.innerHTML = '';
  
  if (notes.length === 0) {
    const emptyState = document.createElement('div');
    emptyState.className = 'empty-state';
    emptyState.innerHTML = `
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
        <polyline points="14 2 14 8 20 8"></polyline>
        <line x1="12" y1="11" x2="12" y2="17"></line>
        <line x1="9" y1="14" x2="15" y2="14"></line>
      </svg>
      <p>No notes yet</p>
      <p style="font-size: 14px; margin: 0;">Click "New Note" to get started</p>
    `;
    notesList.appendChild(emptyState);
    return;
  }

  notes.forEach(note => {
    const noteElement = document.createElement('div');
    noteElement.className = 'note-item';
    
    const createdDate = new Date(note.createdAt).toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric'
    });
    
    const preview = note.content.substring(0, 50).replace(/\n/g, ' ') || 'Empty note';
    
    const contentDiv = document.createElement('div');
    contentDiv.className = 'note-item-content';
    
    const titleDiv = document.createElement('div');
    titleDiv.className = 'note-item-title';
    titleDiv.textContent = note.title;
    
    const previewDiv = document.createElement('div');
    previewDiv.className = 'note-item-preview';
    previewDiv.textContent = preview;
    
    const dateDiv = document.createElement('div');
    dateDiv.className = 'note-item-date';
    dateDiv.textContent = createdDate;
    
    contentDiv.appendChild(titleDiv);
    contentDiv.appendChild(previewDiv);
    contentDiv.appendChild(dateDiv);
    
    const deleteButton = document.createElement('button');
    deleteButton.className = 'btn btn-delete';
    deleteButton.dataset.id = note.id;
    deleteButton.title = 'Delete note';
    deleteButton.innerHTML = `
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
        <polyline points="3 6 5 6 21 6"></polyline>
        <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
        <line x1="10" y1="11" x2="10" y2="17"></line>
        <line x1="14" y1="11" x2="14" y2="17"></line>
      </svg>
    `;
    
    noteElement.appendChild(contentDiv);
    noteElement.appendChild(deleteButton);
    
    // Click to edit note
    contentDiv.addEventListener('click', () => {
      showEditor(note.id);
    });
    
    // Delete button
    deleteButton.addEventListener('click', async (e) => {
      e.stopPropagation();
      if (confirm('Are you sure you want to delete this note?')) {
        await Storage.deleteNote(note.id);
        await displayNotesList();
      }
    });
    
    notesList.appendChild(noteElement);
  });
}

// Show the note editor
async function showEditor(noteId) {
  currentNoteId = noteId;
  notesList.classList.add('hidden');
  noteEditor.classList.remove('hidden');
  
  if (noteId) {
    // Load existing note
    const note = await Storage.getNote(noteId);
    noteTitle.value = note.title;
    noteContent.value = note.content;
  } else {
    // New note
    noteTitle.value = '';
    noteContent.value = '';
  }
  
  noteContent.focus();
}

// Hide the note editor
function hideEditor() {
  noteEditor.classList.add('hidden');
  notesList.classList.remove('hidden');
}

// Save the current note
async function saveCurrentNote() {
  const title = noteTitle.value.trim() || 'Untitled Note';
  const content = noteContent.value;
  
  if (currentNoteId) {
    // Update existing note
    await Storage.saveNote({
      id: currentNoteId,
      title: title,
      content: content
    });
  } else {
    // Create new note
    await Storage.saveNote({
      title: title,
      content: content
    });
  }
  
  hideEditor();
  await displayNotesList();
}

// Escape HTML special characters for security
function escapeHtml(text) {
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };
  return text.replace(/[&<>"']/g, m => map[m]);
}

// Utility function to escape HTML
function escapeHtml(text) {
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#039;'
  };
  return text.replace(/[&<>"']/g, m => map[m]);
}
