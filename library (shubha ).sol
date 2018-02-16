pragma solidity ^0.4.0;
 
contract Library
  {
      uint public totalcount;
        uint public available;
      uint public count;
     
      struct bookdetails{
            string bookname;
            string authorname;
            uint ISBN;
            uint available;
        }
            mapping(uint=>bookdetails)bi;
     struct userdetail{
            string bookname;
            string authorname;
            uint id;
            uint penalty;
            uint time;
            uint issuedate;
             }
             mapping(address=>userdetail)ui;
             function settbook( uint _add,string _bookname,string _authorname,uint _ISBN)public  returns(string,uint)
            {
              bi[_add].bookname=_bookname;
                bi[_add].authorname=_authorname;
                bi[_add].ISBN=_ISBN;
                bi[_add].available=available;
               totalcount=totalcount+1;
             
             }
            function setuser( address _ad,string _bookname,string _authorname,uint _id)public 
             {
         
              ui[_ad].time=now;
              ui[_ad].bookname=_bookname;
              ui[_ad].authorname=_authorname;
              ui[_ad].id=_id;
             count=count+1;
             totalcount=totalcount-1;
            }
          
            
             function getsearch(uint _ISBN,uint _add)public view returns(string)
             { 
                 available=totalcount;
              require(totalcount>0 && _ISBN == bi[_add].ISBN );
                    
                    return("book is available");
            
           }
           function validation(uint _id)public view returns(bool){
               if(count<=3){
               return true;
           
           }
           
           {
                return false;
                   
           }   
           }
           function bookreturn(uint _ISBN)public{
               totalcount=totalcount+1;
               count=count-1;
           }
          function penalty(address _id)public view returns(uint)
           {
               uint validity= 1* 1 minutes;
               uint takentime=now-ui[_id].time;
               if(takentime>validity)
               {
                   takentime=takentime-validity;
                   ui[_id].penalty=(takentime/1)*1;
               
               return  ui[_id].penalty;
               }
  }
  } 
         