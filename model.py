#svm implementation
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#loading the dataset
train = pd.read_csv('train.csv')
test = pd.read_csv("test.csv")

X_train = train.iloc[:, 1:-1].values
Y_train = train.iloc[:,-1].values

X_test = test.iloc[:, 1:-1].values
Y_test = test.iloc[:,-1].values

#feature scaling
from sklearn.preprocessing import StandardScaler
standard = StandardScaler()
X_train = standard.fit_transform(X_train)
X_test = standard.transform(X_test)



#applying svm
from sklearn.svm import SVC
classifier = SVC(kernel='rbf', random_state=0)
classifier.fit(X_train,Y_train)

#prediction
y_pred = classifier.predict(X_test)

#Creating the Confusion matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(Y_test,y_pred)





# # # Visualising the Training set results
# from matplotlib.colors import ListedColormap
# X_set, y_set = X_train[:,0:4], Y_train
# X1, X2 = np.meshgrid(
#     # np.arange(start=X_set[:, 0].min() - 1, stop=X_set[:, 0].max() + 2, step=0.01),
#                      np.arange(start=X_set[:, 1].min() - 1, stop=X_set[:, 1].max() + 1, step=0.01),
#                      np.arange(start=X_set[:, 2].min() - 1, stop=X_set[:, 2].max() + 2, step=0.01),
#                      )
# print("exceutng here")
# plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
#              alpha = 0.75, cmap = ListedColormap(('red', 'green')))
# plt.xlim(X1.min(), X1.max())
# plt.ylim(X2.min(), X2.max())
# for i, j in enumerate(np.unique(y_set)):
#     plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
#                 c = ListedColormap(('red', 'green'))(i), label = j)
# print("reachi last ")
# plt.title('SVM (Training set)')
# plt.xlabel('pdr')
# plt.ylabel('estimated malicious')
# plt.legend()
# plt.show()
# print("done !")

# # Visualising the Test set results
# from matplotlib.colors import ListedColormap
# X_set, y_set = X_test, Y_test
# X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
#                      np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
# plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
#              alpha = 0.75, cmap = ListedColormap(('red', 'green')))
# plt.xlim(X1.min(), X1.max())
# plt.ylim(X2.min(), X2.max())
# for i, j in enumerate(np.unique(y_set)):
#     plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
#                 c = ListedColormap(('red', 'green'))(i), label = j)
# plt.title('SVM (Test set)')
# plt.xlabel('pdr')
# plt.ylabel('Estimated malicious')
# plt.legend()
# plt.show()

# from mlxtend.plotting import plot_decision_regions
#
# plot_decision_regions(X=X_train,
#                       y = Y_train,
#                       clf = classifier,
#                       legend = 4)
#
# plt.xlabel(X_train.columns[3], size=14)
# plt.ylabel(Y_train.columns[0], size=14)
# plt.title('SVM Decision Region Boundary', size=16)
