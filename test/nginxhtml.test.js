const getenv = require('getenv');
const parser = require('node-html-parser').parse;

test('tests output html', async () => {
    const url = String(getenv('APPURL'));
    const respraw = await fetch(url, {cache: "no-store"});
    expect(respraw.status).toBe(200);
    const html = await respraw.text();
    
    const root = parser.parse(html);
    expect(root.getElementsByTagName('h1').length).toBe(1);
    expect(root.getElementsByTagName('p').length).toBe(1);

    const testText = 'Nginx Test 4!';
    expect(root.querySelector('h1').innerHTML).toBe(testText);
    expect(root.querySelector('p').innerHTML).toBe(testText);
});