Vue.component('date', {
  template: `
    <div>{{ current_date }}</div>
  `,
  data() {
    var months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth();
    var day = now.getDate();

    day = (Number(day) <= 9)? '0' + day : day;

    return {
      current_date: months[month] + ' ' + day + ', ' + year
    }
  }
});

