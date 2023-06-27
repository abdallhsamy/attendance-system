import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';

import { IStudent } from '../interfaces/student';


@Injectable({
  providedIn: 'root'
})
export class StudentService {

  _studentListUrl = "http://localhost:5100/students";
  _studentAddUrl = "http://localhost:5100/students/add";
  _studentCaptureUrl = "http://localhost:5100/students/capture";
  _studentDeleteUrl = "http://localhost:5100/students/delete";
  _trainClassifierUrl = "http://localhost:5100/students/train";

  constructor(private http: HttpClient) { }

  getStudentList(): Observable<IStudent[]> {
    return this.http.get<IStudent[]>(this._studentListUrl);
  }

  addStudent(student) {
    return this.http.post<any>(this._studentAddUrl, student);
  }

  captureStudent(student_id, image) {
    return this.http.post<any>(this._studentCaptureUrl + "/" + student_id, image);
  }

  deleteStudent(student_id) {
    return this.http.delete<any>(this._studentDeleteUrl + "/" + student_id);
  }

  trainClassifier() {
    return this.http.get<any>(this._trainClassifierUrl);
  }

}
