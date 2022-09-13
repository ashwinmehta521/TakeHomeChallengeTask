import { LightningElement, api } from 'lwc';
import findUpcomingTaskAndEvent from '@salesforce/apex/UpcomingEventAndTaskController.findUpcomingTaskAndEvent';


export default class DisplayUpcomingEventAndTask extends LightningElement {

    //Variables to hold the data from apex method
    eventSubject;
    eventDueDays;
    taskSubject;
    taskDueDays;
    data;
    displayMessage;
    @api recordId;

    connectedCallback(){
        console.log('RecordId'+this.recordId);
        this.fetchTaskAndEvent();
    }

    fetchTaskAndEvent() {
        findUpcomingTaskAndEvent({contactId:this.recordId})
            .then(result => {
                this.data = result;
                console.log('Data', this.data);
                this.displayMessage = 'Upcoming Event: ' + result.event.Subject + ' in ' + result.numberDaysDueEvent + ' days ' + ' Upcoming Task: ' + result.task.Subject + ' in ' +  result.numberDaysDueTask + ' days';
                
            })
            .catch(error => {
                this.error = error;
            });
    }
}