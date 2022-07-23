
#loading files into R  : 

activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

##### train set files : 

x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")


#renaming columns : 

names(y_train)<-"Activity_id"
names(subject_train)<-"volunteer_id"
names(x_train)<-features[,2]
names(activity_labels)<-c("Activity_id","Activity type")


#merge all in one dataset : 

train_dataset<-cbind(subject_train,y_train,x_train)


######## test set files : 

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

#renaming columns : 

names(y_test)<-"Activity_id"
names(subject_test)<-"volunteer_id"
names(x_test)<-features[,2]

#merge all in one dataset : 

test_dataset<-cbind(subject_test,y_test,x_test)


#final dataset : 

final_dataset<-rbind(train_dataset,test_dataset)


#subsetting the data : 

vec<-grepl("mean|std",names(final_dataset))

res<-final_dataset[,vec==TRUE]

res<-cbind(select(final_dataset , volunteer_id , Activity_id), res)



#merging dataset :

res<-merge(activity_labels,res,by=intersect(names(res),names(activity_labels)))


#creating the tidy dataset : 















