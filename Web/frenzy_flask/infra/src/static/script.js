function get_sessid() {
    return document.getElementById("sessid").innerText;
}

async function new_session() {
    const res = await fetch("/api/session");
    const sessid = await res.json();
    document.location.href = `/notes/${sessid}`;
}

//addEventListener("submit", document.getElementById("upload-notes-form"), function(evt) {
function upload_notes(evt) {
    const notes = document.getElementById("uploaded-notes");
    const form_data = new FormData();
    [...notes.files].map(file => {
        form_data.append(file.name, file);
    });
    const sessid = get_sessid();

    fetch(`/api/notes/${sessid}`, {
        method: "POST",
        body: form_data,
    })
    .then(clear_upload_form)
    .then(update_notes);
}

function clear_upload_form() {
    const form = document.getElementById("upload-notes-form");
    form.reset();
}

async function update_notes() {
    const sessid = get_sessid();
    const res = await fetch(`/api/notes/${sessid}`);
    const notes = await res.json();

    const notes_list = document.createElement("ul");
    notes_list.id = "notes-list";

    notes.forEach(note => {
        let item_html = document.createElement("li");
        let a_html = document.createElement("a");
        a_html.href = `/api/notes/${sessid}/${encodeURI(note)}`
        a_html.innerText = note;

        item_html.appendChild(a_html);
        notes_list.appendChild(item_html);
    });

    document.getElementById("notes-list").replaceWith(notes_list);
    document.getElementById("notes-div").hidden = false;
}
