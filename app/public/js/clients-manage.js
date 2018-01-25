$(document).ready(() => {

    class Clients {
        searchClients(value) {
            const postData = { value };

            $.post("/api/clients/search", postData)
                .done(result => {
                    const clients = JSON.parse(result.data);
                    $('#clients-list').html(this.renderClientsList(clients));
                })
                .catch(error => {
                    return alert('В работе сайте возникла ошибка. Обратитесь к администратору сайта.');
                })
        }

        renderClientsList(clients = []) {

            let resultHtml = '';

            if (clients.length < 1) {
                resultHtml = 'Никого не найдено';
                return resultHtml;
            }

            clients.map(c => {
                resultHtml += `
                    <div class="client-card">
                        <div class="client-card__title">
                            <h2>#${c.id} - ${c.surname} ${c.firstname} ${c.patronymic}</h2>
                            <ul class="text-left">
                                <li>Электронный адрес: <a class="page-link" href="mailto:${c.mail || ''}">${c.mail || ''}</a></li>
                                <li>Номер телефона: <a class="page-link" href="callto:${c.phone}">${c.phone}</a></li>
                                <label>
                                    Администратор:
                                    ${c.admin ? 
                                        `<button class="btn js-clients-toggleAdmin" data-user-id="${c.id}" value="0">Убрать администратора</button>` : 
                                        `<button class="btn js-clients-toggleAdmin" data-user-id="${c.id}" value="1">Сделать администратором</button>`
                                    }
                                </label>
                            </ul>
                        </div>
                    </div>
                `;
            })

            return resultHtml;
        }

        toggleAdmin({ userId, value }) {
            const target = 'admin';
            value = value ? '1' : '0';

            $.post('/api/clients/toggleAdmin', { target, value, id: userId })
                .done(data => {
                    if(data.status !== 'ok') {
                        console.log(data);
                        alert(data.message);
                    }
                    else {
                        location.reload();
                    }
                })
                .catch(error => {
                    return alert('В работе сайте возникла ошибка. Обратитесь к администратору сайта.');
                })
        }
    }

    const clients = new Clients();

    $('.clients-search__input').on('input', function (e) {
        return clients.searchClients(this.value);
    });

    $('#clients-list').on('click', '.js-clients-toggleAdmin', function (e) {
        if(!confirm(this.textContent + '?')) return false;

        return clients.toggleAdmin({userId: this.dataset.userId, value: this.value});
    })
})