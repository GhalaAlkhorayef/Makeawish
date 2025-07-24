const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const app = express();
const PORT = 3000;

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'gg6864870',
    database: 'charitydb'
});


db.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err.stack);
        return;
    }
    console.log('Connected to database.');
});


app.use(express.json());
app.use(express.urlencoded({ extended: true }));



app.post('/donate', (req, res) => {
    const { name, email, phone, amount, honor_name, campaign_title } = req.body;

    const query = `
    INSERT INTO donations (name, email, phone, amount, honor_name, campaign_title, date)
    VALUES (?, ?, ?, ?, ?, ?, NOW())
    `;

    db.query(query, [name, email, phone, amount, honor_name, campaign_title], (err, results) => {
        if (err) {
            console.error('Error saving donation:', err);
            res.status(500).send('Error saving donation.');
        } else {
            res.status(200).send('Donation saved successfully.');
        }
    });
});


app.get('/recent-donations', (req, res) => {
    db.query('SELECT name, amount, date FROM donations ORDER BY date DESC LIMIT 5', (err, results) => {
      if (err) {
        console.error('Error fetching donations:', err);
        res.status(500).send('Database error');
      } else {
        res.json(results); 
      }
    });
});
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'HomePage.html'));
  });
 
  app.post('/submit_campaign', (req, res) => {
    const { title, description } = req.body;

    const query = `
    INSERT INTO campaigns (title, description, created_at)
    VALUES (?, ?, NOW())
    `;

    db.query(query, [title, description], (err, results) => {
        if (err) {
            console.error('Error saving campaign:', err.message); // <-- print the real error
            res.status(500).send('Error saving campaign: ' + err.message); // <-- send the real error to you
        } else {
            res.send('<script>alert("Campaign submitted successfully!"); window.location.href="/CampaignsPage.html";</script>');
        }
    });
});

app.post('/volunteer', (req, res) => {
    const { name, email, phone, interest } = req.body;

    const query = `
    INSERT INTO volunteers (name, email, phone, interest, registered_at)
    VALUES (?, ?, ?, ?, NOW())
    `;

    db.query(query, [name, email, phone, interest], (err, results) => {
        if (err) {
            console.error('Error saving volunteer:', err);
            res.status(500).send('Error saving volunteer.');
        } else {
            res.status(200).send('Volunteer registered successfully.');
        }
    });
});

app.get('/volunteer', (req, res) => {
    db.query('SELECT * FROM volunteers ORDER BY registered_at DESC', (err, results) => {
        if (err) {
            console.error('Error fetching volunteers:', err);
            res.status(500).send('Error fetching volunteers.');
        } else {
            res.json(results);
        }
    });
});

app.put('/volunteer/:id', (req, res) => {
    const { id } = req.params;
    const { name, email, phone, interest } = req.body;

    const query = `
    UPDATE volunteers
    SET name = ?, email = ?, phone = ?, interest = ?
    WHERE id = ?
    `;

    db.query(query, [name, email, phone, interest, id], (err, results) => {
        if (err) {
            console.error('Error updating volunteer:', err);
            res.status(500).send('Error updating volunteer.');
        } else {
            res.status(200).send('Volunteer updated successfully.');
        }
    });
});

app.delete('/volunteer/:id', (req, res) => {
    const { id } = req.params;

    const query = `DELETE FROM volunteers WHERE id = ?`;

    db.query(query, [id], (err, results) => {
        if (err) {
            console.error('Error deleting volunteer:', err);
            res.status(500).send('Error deleting volunteer.');
        } else {
            res.status(200).send('Volunteer deleted successfully.');
        }
    });
});

app.use(express.static(path.join(__dirname, 'public'))); // Only ONE TIME here!


app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
