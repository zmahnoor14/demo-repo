#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import the function file
from Workflow_Python_Functions import *


# In[ ]:


#Define input directory, keep all files in same directory and scripts so getwd works
input_dir = os.getcwd()+"/data"
input_dir


# In[ ]:


spec_postproc(input_dir, Source = "all")


# In[ ]:


MCSS_for_SpecDB(input_dir, Source = "all")


# In[ ]:


sirius_postproc(input_dir)


# In[ ]:


MCSS_for_SIRIUS(input_dir)    


# In[ ]:


CandidateSelection_SimilarityandIdentity(input_dir, standards = False)


# In[ ]:


merge_all_results(input_dir)


# In[ ]:


#classification(input_dir, resultcsv = input_dir + "/final_candidates.csv")

